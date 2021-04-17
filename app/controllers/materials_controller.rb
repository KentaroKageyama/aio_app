class MaterialsController < ApplicationController
  before_action :authenticate_user!

  def create
    material = Material.new(material_params)
    material.save
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

  def material_params
    params.require(:material).permit(:name)
  end
end
