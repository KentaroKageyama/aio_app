class GlassesController < ApplicationController
  def create
    glass = Glass.new(glass_params)
    glass.save
    redirect_to root_path
  end

  def destroy
    glass = Glass.find(params[:id])
    glass.destroy
    redirect_to root_path
  end

  def sort
    glass = Glass.find_by(position: params[:from].to_i + 1)
    glass.insert_at(params[:to].to_i + 1)
    head :ok
  end
  
  
  private

  def glass_params
    params.require(:glass).permit(:name, :opal_color_id)
  end
  
end
