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
  
  def sort
    part = Part.find_by(position: params[:from].to_i + 1)
    part.insert_at(params[:to].to_i + 1)
    head :ok
  end

  private

  def part_params
    params.require(:part).permit(:name, :material_id)
  end
  
end
