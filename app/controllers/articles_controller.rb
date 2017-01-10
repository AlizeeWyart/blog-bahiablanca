class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :map ]

  def show
    @article = Article.find(params[:id])
    @other_articles = Article.all.limit(3)
    @regions = @article.regions.select { |region| region.code != "MEX-ALL"}
    @comments = Comment.select {|c| c.article = @article }
    @new_comment = Comment.new(article: @article)
  end
end
