class PartsController < ApplicationController

  def create
    part = Part.new(part_params)
    part.save
    redirect_to root_path
  end

  def destroy
    part = Part.find(params[:id])
    part.destroy
    redirect_to root_path
  end
  
  private

  def part_params
    params.require(:part).permit(:name, :material_id)
  end
  
end
