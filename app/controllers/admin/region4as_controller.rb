class Admin::Region4asController < ApplicationController
  before_action :is_admin?

  def create
    @region4a = Region4a.new(region4a_params)
    if @region4a.save
       redirect_to admin_article_path(@region4a.article)
    else
       render admin_article_path(params[:article_id])
    end
  end

  def destroy
    @region4a = Region4a.find(params[:id])
    @article = @region4a.article
    @region4a.delete
    redirect_to admin_article_path(@article)
  end

  private

  def region4a_params
    params.require(:region4a).permit(:article_id, :region_id)
  end

  def is_admin?
    redirect_to root_path unless current_user.admin?
  end
end
