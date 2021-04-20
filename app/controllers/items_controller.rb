class ItemsController < ApplicationController
  before_action :search_item, only: [:index, :search]
  before_action :authenticate_user!

  def index
    @items = @p.result.order(:position)
    @collections = Collection.all.order(:position)
    @categories = Category.all.order(:position)
    @opal_colors = OpalColor.all.order(:position)
    @materials = Material.all.order(:position)
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    @items = Item.all.order(:position)
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to new_item_path
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item  = Item.find(params[:id])
    @item.update(item_params.merge(position: params[:position]))
    redirect_to action: :index
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to new_item_path
  end

  def search
    @results = @p.result
  end

  def incremental_search
    return nil if params[:keyword] == ""
    item = Item.where(['chain_name LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: item }
  end

  def sort
    item = Item.find_by(position: params[:from].to_i + 1)
    item.insert_at(params[:to].to_i + 1)
    head :ok
  end

  def new_other
    @collection = Collection.new
    @collections = Collection.all.order(:position)
    @category = Category.new
    @categories = Category.all.order(:position)
    @material = Material.new
    @materials = Material.all.order(:position)
    @opal_color = OpalColor.new
    @opal_colors = OpalColor.all.order(:position)
  end

  def output_price
    price = Item.find_by(chain_name: params[:name]).price
    render json: {price: price} 
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :image, :collection_id, :category_id, :opal_color_id, :material_id,
      item_parts_attributes: [:id, :part_id, :quantity, :_destroy], item_glasses_attributes: [:id, :glass_id, :quantity, :_destroy] ).merge(chain_name: set_chain_name)
  end

  def search_item
    @p = Item.ransack(params[:q])
  end

  def set_chain_name
    array = []
    items = params.require(:item)
    array << Collection.find(items[:collection_id]).name
    array << items[:name]
    array << Category.find(items[:category_id]).name
    array << Material.find(items[:material_id]).name if items[:material_id].present?
    array << OpalColor.find(items[:opal_color_id]).color if items[:opal_color_id].present?
    return array.join(" ")
  end

end
