class Admin::DashboardController < ApplicationController
  before_action :is_admin?

  def home
    @page = Page.find(1)
    @infos = PageInfo.select{|info| info.page = @page}.sort_by {|info| info.id }
    @title_region_map = PageInfo.find_by(name: "title_region_map")
    @title_category = PageInfo.find_by(name: "title_category")
    @categories = Category.all
  end

  def categories
    @new_category = Category.new
    @categories = Category.all.order(:id)
  end

  def articles
    @new_category = Category.new
    @categories = Category.all.order(:id)
  end

  private

  def is_admin?
    redirect_to root_path unless current_user.admin?
  end
end
