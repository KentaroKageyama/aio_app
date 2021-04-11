class ItemsController < ApplicationController

  def index
    @item = Item.new
    @items = Item.all
    @part = Part.new
    @parts = Part.all
    @glass = Glass.new
    @glasses = Glass.all
    @collection = Collection.new
    @collections = Collection.all
    @category = Category.new
    @categories = Category.all
    @material = Material.new
    @materials = Material.all
    @opal_color = OpalColor.new
    @opal_colors = OpalColor.all
  end

  def create
    item = Item.new(item_params)
    item.save
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :collection_id, :category_id, part_ids: [], glass_ids: [] )
  end

end
