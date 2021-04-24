class PartsController < ApplicationController
  before_action :authenticate_user!

  def new
    @part = Part.new
    @parts = Part.all.order(:position)
  end

  def create
    part = Part.new(set_part)
    part.save
    redirect_to new_part_path
  end

  def edit
    @part = Part.find(params[:id])
  end

  def update
    @part = Part.find(params[:id])
    @part.update(set_part)
    redirect_to new_part_path
  end

  def destroy
    part = Part.find(params[:id])
    part.destroy
    redirect_to new_part_path
  end
  
  def sort
    part = Part.find_by(position: params[:from].to_i + 1)
    part.insert_at(params[:to].to_i + 1)
    head :ok
  end

  private

  def set_part
    params.require(:part).permit(:name, :material_id)
  end
  
end
