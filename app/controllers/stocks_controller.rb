class StocksController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @stock_inventory = StockInventory.new
    @stocks = Stock.all
    @inventories = Inventory.all
  end

  def create
    @stock_inventory = StockInventory.new(stock_params)
    if @stock_inventory.valid?
      @stock_inventory.save
      redirect_to action: :index
    else
      render action: :index
    end
  end

  private

  def stock_params
    params.require(:stock_inventory).permit(:item_id, :quantity, :quantity, :date, :content, :inv_quantity, :in_out)
  end

end
