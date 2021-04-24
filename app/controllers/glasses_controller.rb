class GlassesController < ApplicationController
  before_action :authenticate_user!

  def new
    @glass = Glass.new
    @glasses = Glass.all.order(:position)
  end
  
  def create
    glass = Glass.new(set_glass)
    glass.save
    redirect_to new_glass_path
  end

  def edit
    @glass = Glass.find(params[:id])
  end

  def update
    @glass = Glass.find(params[:id])
    @glass.update(set_glass)
    redirect_to new_glass_path
  end


  def destroy
    glass = Glass.find(params[:id])
    glass.destroy
    redirect_to new_glass_path
  end

  def sort
    glass = Glass.find_by(position: params[:from].to_i + 1)
    glass.insert_at(params[:to].to_i + 1)
    head :ok
  end
  
  
  private

  def set_glass
    params.require(:glass).permit(:name, :opal_color_id)
  end
  
end
