class GlassesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_glass, only: [:edit, :update, :destroy]

  def new
    @glass = Glass.new
    @glasses = Glass.all.order(:position).includes([:opal_color])
    @opal_colors = OpalColor.all.order(:position)
  end

  def create
    @glasses = Glass.all.order(:position).includes([:opal_color])
    @opal_colors = OpalColor.all.order(:position)
    @glass = Glass.new(glass_params)
    if @glass.save
      redirect_to new_glass_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @glass.update(glass_params)
      redirect_to new_glass_path
    else
      render :edit
    end
  end

  def destroy
    @glass.destroy
    redirect_to new_glass_path
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

  def set_glass
    @glass = Glass.find(params[:id])
  end

end
