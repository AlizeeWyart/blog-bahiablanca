class Admin::ContentsController < ApplicationController
  before_action :is_admin?

  def new
    @content = Content.new()
    @article = Article.find(params[:article_id])
    # LES STYLES
    if params[:style] == "0"
      @style = Content::STYLE[0]
    elsif params[:style] == "1"
      @style = Content::STYLE[1]
    elsif params[:style] == "2"
      @style = Content::STYLE[2]
    elsif params[:style] == "3"
      @style = Content::STYLE[3]
    elsif params[:style] == "4"
      @style = Content::STYLE[4]
    end
  end


  def create
    @content = Content.new(content_params)
    @article = @content.article
    @contents = Content.select {|content| content.article = @article }.sort_by {|c| c.order}
    if @contents.count == 0
      @content.order = 1
    else
      @content.order = @contents.last.order + 1
    end
    if @content.save
       redirect_to admin_article_path(@article)
    else
       redirect_to admin_article_path(@article)
    end
  end

  def update
    @content = Content.find(params[:id])
    @content.update(content_params)
    @article = @content.article
    redirect_to admin_article_path(@article)
  end

  def destroy
    @content = Content.find(params[:id])
    @article = @content.article
    @content.delete
    redirect_to admin_article_path(@article)
  end

  private

  def content_params
    params.require(:content).permit(:article_id, :style, :text, :video, :order, :photo, :photo_cache, :photo2, :photo2_cache)
  end

  def is_admin?
    redirect_to root_path unless current_user.admin?
  end
end
