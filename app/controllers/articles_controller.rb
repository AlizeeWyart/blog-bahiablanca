class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :map ]

  def show
    @article = Article.find(params[:id])
    @other_articles = Article.all.limit(3)
    @regions = @article.regions.select { |region| region.code != "MEX-ALL"}
    @comments = Comment.select {|c| c.article = @article }
    @new_comment = Comment.new(article: @article)
    @contents = Content.select {|c| c.article = @article }
    @hash = Gmaps4rails.build_markers(@article) do |article, marker|
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
end
