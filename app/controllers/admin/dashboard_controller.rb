class Admin::DashboardController < ApplicationController
  before_action :is_admin?

  def home
    @page = Page.find(1)
    @infos = PageInfo.select{|info| info.page = @page}.sort_by {|info| info.id }
    @title_region_map = PageInfo.find_by(name: "title_region_map")
    @title_category = PageInfo.find_by(name: "title_category")
    @second_title = PageInfo.find_by(name: "home_second_title")
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

  def regions
    @regions = Region.all.sort_by { |region| region.code }
    if params[:region]
      @region = Region.find_by_name(params[:region])
    end
  end

  private

  def is_admin?
    redirect_to root_path unless current_user.admin?
  end
end
