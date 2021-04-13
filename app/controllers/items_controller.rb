class ItemsController < ApplicationController

  def index
    @item = Item.new
    @items = Item.all.order(:position)
    @part = Part.new
    @parts = Part.all.order(:position)
    @glass = Glass.new
    @glasses = Glass.all.order(:position)
    @collection = Collection.new
    @collections = Collection.all.order(:position)
    @category = Category.new
    @categories = Category.all.order(:position)
    @material = Material.new
    @materials = Material.all.order(:position)
    @opal_color = OpalColor.new
    @opal_colors = OpalColor.all.order(:position)
  end

  def create
    binding.pry
    item = Item.new(item_params)
    item.save
    redirect_to root_path
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  def sort
    item = Item.find_by(position: params[:from].to_i + 1)
    item.insert_at(params[:to].to_i + 1)
    head :ok
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :image, :collection_id, :category_id, :opal_color_id, item_parts_attributes: [:id, :part_id, :quantity, :_destroy], item_glasses_attributes: [:id, :glass_id, :quantity, :_destroy] )
  end

end
