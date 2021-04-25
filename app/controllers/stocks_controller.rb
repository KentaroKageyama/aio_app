class StocksController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @stock = Stock.new
    @stocks = Stock.all
    @inventories = Inventory.all
  end

end
