class OpalColorsController < ApplicationController
  before_action :authenticate_user!

  def create
    opal_color = OpalColor.new(set_opal_color)
    opal_color.save
    redirect_to new_other_items_path
  end

  def edit
    @opal_color = OpalColor.find(params[:id])
  end

  def update
    @opal_color = OpalColor.find(params[:id])
    @opal_color.update(set_opal_color)
    redirect_to new_other_items_path
  end

  def destroy
    opal_color = OpalColor.find(params[:id])
    opal_color.destroy
    redirect_to new_other_items_path
  end

  def sort
    opal_color = OpalColor.find_by(position: params[:from].to_i + 1)
    opal_color.insert_at(params[:to].to_i + 1)
    head :ok
  end
  
  private

  def set_opal_color
    params.require(:opal_color).permit(:color)
  end
end
