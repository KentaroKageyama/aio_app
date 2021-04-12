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
  
  def sort
    category = Category.find_by(position: params[:from].to_i + 1)
    category.insert_at(params[:to].to_i + 1)
    head :ok
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
