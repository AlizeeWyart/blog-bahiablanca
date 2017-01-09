class Admin::ArticlesController < ApplicationController
  before_action :is_admin?

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @categories = @article.categories
    @all_categories = Category.all
    @category4a = Category4a.new(article: @article)
    @regions = @article.regions
    @region4a = Region4a.new(article: @article)
    @all_regions = Region.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      redirect_to admin_article_path(@article)
    else
      render :new
    end
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to admin_article_path(@article)
  end

  private

  def is_admin?
    redirect_to root_path unless current_user.admin?
  end

  def article_params
    params.require(:article).permit(:title, :short_description, :content, :date, :photo, :photo_cache)
  end
end