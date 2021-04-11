class MaterialsController < ApplicationController
  def create
    material = Material.new(material_params)
    material.save
    redirect_to root_path
  end

  def destroy
    material = Material.find(params[:id])
    material.destroy
    redirect_to root_path
  end
  
  private

  def material_params
    params.require(:material).permit(:name)
  end
end
