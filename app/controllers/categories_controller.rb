class CategoriesController < ApplicationController
  def create
    category = Category.new(category_params)
    category.save
    redirect_to root_path
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    redirect_to root_path
  end
  
  private

  def category_params
    params.require(:category).permit(:name)
  end
end
