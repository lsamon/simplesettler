class Admin::ArticlesController < Admin::BaseController
    before_action :find_or_initialize_article, except: [:index]

    def show
    end

    def index
      @articles = Article.page(params[:page]).reorder(sort_order)
      @categories = Category.all
    end

    def new
    end

    def create
      @article = Article.new(article_params)
      @article.user = @current_user

      if @article.save
        add_cities
        redirect_to admin_articles_path
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @article.update_attributes(article_params)
        add_cities
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
      params.fetch(:article, {}).permit(:title, :content, :city_ids, :user_id, :image, :category_id, :status)
    end

    def add_cities
      cities = params[:article][:city_ids].reject{ |n| n == "" }.map do | city_id |
        City.find(city_id.to_i)
      end
      @article.cities = cities
      @article.save
    end

    def sort_options
      {'title' => 'title', 'status' => 'status'}
    end
end
