class MaterialsController < ApplicationController
  before_action :authenticate_user!

  def create
    material = Material.new(set_material)
    material.save
    redirect_to new_other_items_path
  end

  def edit
    @material = Material.find(params[:id])
  end

  def update
    @material = Material.find(params[:id])
    @material.update(set_material)
    redirect_to new_other_items_path
  end


  def destroy
    material = Material.find(params[:id])
    material.destroy
    redirect_to new_other_items_path
  end

  def sort
    material = Material.find_by(position: params[:from].to_i + 1)
    material.insert_at(params[:to].to_i + 1)
    head :ok
  end
  
  private

  def set_material
    params.require(:material).permit(:name)
  end
end
