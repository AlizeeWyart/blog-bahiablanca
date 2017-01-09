class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :map, :category ]

  def home
    @page = Page.find(1)
    @categories = Category.all
    # CONTENU & TEXT
    @title_region_map = PageInfo.find_by(name: "title_region_map")
    @title_category = PageInfo.find_by(name: "title_category")
    @infos = PageInfo.select{|info| info.page = @page}.sort_by {|info| info.id }
  end

  def map
    @all_articles = Article.all
    @title_region_map = PageInfo.find_by(name: "title_region_map")
    @title_category = PageInfo.find_by(name: "title_category")
    @all_categories = Category.all
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
  end

  def profile
    @admin_users = User.find_by_admin(true)
  end
end
