class InventoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_inventory, only: [:edit, :update, :destroy]

  def index
    @stock_inventory = StockInventory.new
    @stocks = Stock.all
    @inventories = Inventory.all.order(id: :DESC)
  end

  def create
    @stock_inventory = StockInventory.new(inventory_params)
    if @stock_inventory.valid?
      @stock_inventory.save
      redirect_to action: :index
    else
      render action: :index
    end
  end

  def edit
    @stock_inventory = StockInventory.new(inventory: @inventory)
  end

  def update
    @stock_inventory = StockInventory.new(inventory_params, inventory: @inventory)
    if @stock_inventory.valid?
      @stock_inventory.update_save
      redirect_to action: :index
    else
      render action: :index
    end
  end

  def destroy
    destroy_stock_calc
    @inventory.destroy
    redirect_to action: :index
  end

  private

  def destroy_stock_calc
    stock = Stock.find(@inventory.stock_id)
    if @inventory.in_out_id == 1
      qty = stock.quantity - @inventory.inv_quantity
      stock.update_attribute(:quantity, qty)
    elsif @inventory.in_out_id == 2
      qty = stock.quantity + @inventory.inv_quantity
      stock.update_attribute(:quantity, qty)
    end
  end

  def inventory_params
    params.require(:inventory).permit(:item_id, :quantity, :date, :content, :inv_quantity, :in_out)
  end

  def set_inventory
    @inventory = Inventory.find(params[:id])
  end
end
