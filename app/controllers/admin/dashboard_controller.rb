class Admin::DashboardController < ApplicationController
  def home
    @page = Page.find(1)
    @infos = PageInfo.select{|info| info.page = @page}.sort_by {|info| info.id }
  end
end
