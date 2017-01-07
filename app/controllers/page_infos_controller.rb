class PageInfosController < ApplicationController
  def update
    @info = PageInfo.find(params[:id])
    @info.update(info_params)
    redirect_to admin_path
  end

  private

  def info_params
    params.require(:page_info).permit(:name, :content)
  end
end
