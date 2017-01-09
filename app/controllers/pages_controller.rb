class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @page = Page.find(1)
    @categories = Category.all
    @infos = PageInfo.select{|info| info.page = @page}.sort_by {|info| info.id }
  end

  def map
    @all_articles = Article.all
    if params[:region]
      @region = Region.find_by_name(params[:region])
      if @region
        @articles = @region.articles
      else
        @articles = []
      end
    end
    if params[:category]
      @category = Category.find_by_code(params[:category])
      if @category
        @articles = @category.articles
      else
        @articles = []
      end
    end
    if params[:article_id]
      @article = Article.find(params[:article_id])
      @regions = @article.regions.select { |region| region.code != "MEX-ALL"}
    end
  end

  def category
    @all_articles = Article.all
    @categories = Category.all
    if params[:category]
      @region = Region.find_by_name(params[:category])
      if @region
        @articles = @region.articles
      else
        @articles = []
      end
    end
    if params[:article_id]
      @article = Article.find(params[:article_id])
    end
  end
end
