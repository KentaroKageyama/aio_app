class PartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_part, only: [:edit, :update, :destroy]

  def new
    @part = Part.new
    @parts = Part.all.order(:position).includes([:material])
  end

  def create
    part = Part.new(part_params)
    part.save
    redirect_to new_part_path
  end

  def edit
  end

  def update
    @part.update(part_params)
    redirect_to new_part_path
  end

  def destroy
    @part.destroy
    redirect_to new_part_path
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

  def set_part
    @part = Part.find(params[:id])
  end
end
