class Admin::Category4asController < ApplicationController
  before_action :is_admin?

  def create
    @category4a = Category4a.new(category4a_params)
    @article = @category4a.article
    if @category4a.save
       redirect_to admin_article_path(@article)
    else
       redirect_to admin_article_path(@article)
    end
  end

  def destroy
    @category4a = Category4a.find(params[:id])
    @article = @category4a.article
    @category4a.delete
    redirect_to admin_article_path(@article)
  end

  private

  def category4a_params
    params.require(:category4a).permit(:article_id, :category_id)
  end

  def is_admin?
    redirect_to root_path unless current_user.admin?
  end
end
