class PartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_part, only: [:edit, :update, :destroy]

  def new
    @part = Part.new
    @parts = Part.all.order(:position).includes([:material])
    @materials = Material.all.order(:position)
  end

  def create
    @parts = Part.all.order(:position).includes([:material])
    @materials = Material.all.order(:position)
    @part = Part.new(part_params)
    if @part.save
      redirect_to new_part_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @part.update(part_params)
      redirect_to new_part_path
    else
      render :edit
    end
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
