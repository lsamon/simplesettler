class Admin::ArticlesController < Admin::BaseController
    before_action :find_or_initialize_article, except: [:index]

    def show
    end

    def index
      @articles = Article.page(params[:page]).per(20).reorder(sort_order)
      respond_to do |format|
        format.html
        format.js { render "/shared/admin" }
      end
    end

    def new
    end

    def create
      @article = Article.new(article_params)
      @article.user = @current_user
      @article.cities = cities

      if @article.save
        redirect_to admin_articles_path
      else
        render :new
      end
    end

    def edit
    end

    def update
      @article.cities = cities if cities.present?
      if @article.update_attributes(article_params)
        redirect_to admin_articles_path
      else
        render :edit
      end
    end

    def destroy
      @article.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
    def find_or_initialize_article
      @article = params[:id] ? Article.find(params[:id]) : Article.new
    end

    def article_params
      params.fetch(:article, {}).permit(:title, :content, :content_type, :city_ids, :image, :category_id, :status,
      :meta_title, :meta_description, :meta_keywords, :featured, :external_url)
    end

    def cities
      return unless params[:article][:city_ids].present?
      params[:article][:city_ids].select{|n| n.present?}.map do | city_id |
        City.find(city_id.to_i)
      end
    end

    def sort_options
      {'title' => 'title', 'status' => 'status'}
    end
end
