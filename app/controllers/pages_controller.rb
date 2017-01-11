class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :map ]

  def home
    @page = Page.find(1)
    @categories = Category.all
    # CONTENU & TEXT
    @title_region_map = PageInfo.find_by(name: "title_region_map")
    @title_category = PageInfo.find_by(name: "title_category")
    @infos = PageInfo.select{|info| info.page = @page}.sort_by {|info| info.id }
    @map_articles = Article.where.not(latitude: nil, longitude: nil)
    @hash = Gmaps4rails.build_markers(@map_articles) do |article, marker|
      marker.lat article.latitude
      marker.lng article.longitude
      marker.infowindow render_to_string(:partial => "/shared/infowindow", :locals => { :article => article})
      # if article.country == "Mexique"
      #   marker.picture({
      #    :url => "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=I|04677D|000000",
      #    :width   => 32,
      #    :height  => 32
      #   })
      # elsif article.country == "Mexique"
      #   marker.picture({
      #    :url => "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=A|FEC300|000000",
      #    :width   => 32,
      #    :height  => 32
      #   })
      # else
      #   marker.picture({
      #    :url => "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=C|13CE66|000000",
      #    :width   => 32,
      #    :height  => 32
      #   })
      # end
    end
  end

  def map
    @all_articles = Article.all
    @map_articles = Article.where.not(latitude: nil, longitude: nil)
    @title_region_map = PageInfo.find_by(name: "title_region_map")
    @title_category = PageInfo.find_by(name: "title_category")
    @all_categories = Category.all
    # if params[:region]
    #   @region = Region.find_by_name(params[:region])
    #   if @region
    #     @articles = @region.articles
    #   else
    #     @articles = []
    #   end
    # end
    if params[:category]
      @category = Category.find_by_code(params[:category])
      if @category
        @articles = @category.articles
        @map_articles = @articles.where.not(latitude:nil, longitude:nil)
        @hash = Gmaps4rails.build_markers(@map_articles) do |article, marker|
          marker.lat article.latitude
          marker.lng article.longitude
          marker.infowindow render_to_string(:partial => "/shared/infowindow", :locals => { :article => article})
        end
      else
        @articles = []
      end
    else
      @hash = Gmaps4rails.build_markers(@map_articles) do |article, marker|
        marker.lat article.latitude
        marker.lng article.longitude
        marker.infowindow render_to_string(:partial => "/shared/infowindow", :locals => { :article => article})
      end
    end
    # if params[:category] && params[:region]
    #   @category = Category.find_by_code(params[:category])
    #   @region = Region.find_by_name(params[:region])
    #   find_articles(@region, @category).uniq!
    # end
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

  private

  def find_articles(region, category)
    @articles = []
    if category && region
      category.articles.each do |a|
        @articles << a
      end
    end
    if region
      region.articles.each do |r|
        @articles << r
      end
    end
    return @articles
  end
end
