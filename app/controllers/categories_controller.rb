class CategoriesController < ApplicationController
  def create
    @category = Category.new(category_params)
    if @category.save
       redirect_to admin_thematics_path
    else
       alert("Problème de création");
    end
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    redirect_to admin_thematics_path
  end

  def destroy
   @category = Category.find(params[:id])
   @category.delete
   redirect_to admin_thematics_path
  end

  private

  def category_params
    params.require(:category).permit(:name, :short_description)
  end
end
