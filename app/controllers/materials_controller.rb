class MaterialsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_material, only: [:edit, :update, :destroy]

  def create
    material = Material.new(material_params)
    material.save
    redirect_to new_other_items_path
  end

  def edit
  end

  def update
    @material.update(material_params)
    redirect_to new_other_items_path
  end

  def destroy
    @material.destroy
    redirect_to new_other_items_path
  end

  def sort
    material = Material.find_by(position: params[:from].to_i + 1)
    material.insert_at(params[:to].to_i + 1)
    head :ok
  end
  
  private

  def material_params
    params.require(:material).permit(:name)
  end

  def set_material
    @material = Material.find(params[:id])
  end

end
