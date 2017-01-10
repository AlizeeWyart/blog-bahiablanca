class Admin::RegionsController < ApplicationController
  before_action :is_admin?

  def update
    @region = Region.find(params[:id])
    @region.update(region_params)
    redirect_to admin_regions_path
  end

  private

  def region_params
    params.require(:region).permit(:short_description, :description)
  end

  def is_admin?
    redirect_to root_path unless current_user.admin?
  end
end
