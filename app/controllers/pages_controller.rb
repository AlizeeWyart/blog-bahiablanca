class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :map, :timeline ]

  def home
    @contact = Contact.new
    @page = Page.find(1)
    @categories = Category.all
    # CONTENU & TEXT
    @second_title = PageInfo.find_by(name: "home_second_title")
    @title_region_map = PageInfo.find_by(name: "title_region_map")
    @title_category = PageInfo.find_by(name: "title_category")
    @infos = PageInfo.select{|info| info.page = @page}.sort_by {|info| info.id }
    @all_articles = Article.all
    # MAP
    @map_articles = Article.where.not(latitude: nil, longitude: nil)
    @hash = Gmaps4rails.build_markers(@map_articles) do |article, marker|
      marker.lat article.latitude
      marker.lng article.longitude
      marker.infowindow render_to_string(:partial => "/shared/infowindow", :locals => { :article => article})
      if article.category.id == 3
        marker.picture({
         :url => "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=V|1EC9E5|000000",
         :width   => 32,
         :height  => 32
        })
      elsif article.category.id == 2
        marker.picture({
         :url => "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=C|FACC00|000000",
         :width   => 32,
         :height  => 32
        })
      else
        marker.picture({
         :url => "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=A|FEC300|000000",
         :width   => 32,
         :height  => 32
        })
      end
    end
  end

  def map
    @contact = Contact.new
    @all_articles = Article.select { |a| a.status == "PUBLIE"}
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
        @articles = @category.articles.where(status: "PUBLIE")
        @map_articles = @articles.where.not(latitude:nil, longitude:nil)
        @hash = Gmaps4rails.build_markers(@map_articles) do |article, marker|
          marker.lat article.latitude
          marker.lng article.longitude
          marker.infowindow render_to_string(:partial => "/shared/infowindow", :locals => { :article => article})
          if article.category.code == "VOYAGE"
            marker.picture({
             :url => "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=V|1EC9E5|000000",
             :width   => 32,
             :height  => 32
            })
          elsif article.category.code == "ART"
            marker.picture({
             :url => "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=A|FACC00|000000",
             :width   => 32,
             :height  => 32
            })
          else
            marker.picture({
             :url => "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=A|FEC300|000000",
             :width   => 32,
             :height  => 32
            })
          end
        end
      else
        @articles = []
      end
    else
      @hash = Gmaps4rails.build_markers(@map_articles) do |article, marker|
        marker.lat article.latitude
        marker.lng article.longitude
        marker.infowindow render_to_string(:partial => "/shared/infowindow", :locals => { :article => article})
        if article.category.code == "VOYAGE"
          marker.picture({
           :url => "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=V|1EC9E5|000000",
           :width   => 32,
           :height  => 32
          })
        elsif article.category.code == "ART"
          marker.picture({
           :url => "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=A|FACC00|000000",
           :width   => 32,
           :height  => 32
          })
        else
          marker.picture({
           :url => "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=A|FEC300|000000",
           :width   => 32,
           :height  => 32
          })
        end
      end
    end
    # if params[:category] && params[:region]
    #   @category = Category.find_by_code(params[:category])
    #   @region = Region.find_by_name(params[:region])
    #   find_articles(@region, @category).uniq!
    # end
  end

  def category
    @contact = Contact.new
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
    @contact = Contact.new
    @admin_users = User.find_by_admin(true)
  end

  def timeline
    @contact = Contact.new
    @all_articles = Article.all
    @categories = Category.all
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
