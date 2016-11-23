class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @articles = Article.all

    @article = set_article
  end

  def new
    @article = Article.new
end

  def edit
    @article = set_article
  end

  def update
    @article = set_article
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
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

  def destroy
    article = set_article
    article.destroy
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content, :city_id, :user_id, :featured_image)
  end
end
