class OpalColorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_opal_color, only: [:edit, :update, :destroy]

  def create
    opal_color = OpalColor.new(opal_color_params)
    opal_color.save
    redirect_to new_other_items_path
  end

  def edit
  end

  def update
    @opal_color.update(opal_color_params)
    redirect_to new_other_items_path
  end

  def destroy
    @opal_color.destroy
    redirect_to new_other_items_path
  end

  def sort
    opal_color = OpalColor.find_by(position: params[:from].to_i + 1)
    opal_color.insert_at(params[:to].to_i + 1)
    head :ok
  end

  private

  def opal_color_params
    params.require(:opal_color).permit(:color)
  end

  def set_opal_color
    @opal_color = OpalColor.find(params[:id])
  end
end
