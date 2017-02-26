class ArticlesController < ApplicationController
  before_action :check_for_admin, :only => [:edit, :create, :new, :destroy, :update]
  before_action :find_or_initialize_article

  def index
    @articles = Article.all
  end

  def show
    @articles = Article.all
  end

  def check_helpful
    @helpful = params[:helpful]

    user_id = user_signed_in? ? current_user.id : nil

    if @helpful == "Yes"
      Helpful.create :helped => true, :user_id => user_id, :article_id => params[:id]
    else
      Helpful.create :helped => false, :user_id => user_id, :article_id => @article
    end

    respond_to do |format|
      format.html { redirect_to '#'}
      format.js
    end

  end

  def new
  end

  def create
    @article = Article.new(article_params)
    @article.user = @current_user

    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update_attributes(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def find_or_initialize_article
    @article = params[:id] ? Article.where(id: params[:id]).first : Article.new
  end

  def article_params
    params.fetch(:article, {}).permit(:title, :content, :cities, :user_id, :image, :category_id)
  end
end
