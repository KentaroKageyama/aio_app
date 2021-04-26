class InventoriesController < ApplicationController

  def edit
  end

  def destroy
    @inventory = Inventory.find(params[:id])
    change_stock
    @inventory.destroy
    redirect_to stocks_path
  end

  private

  def change_stock
    stock = Stock.find(@inventory.stock_id)
    binding.pry
    if @inventory.in_out_id == 1
      qty = stock.quantity - @inventory.inv_quantity
      stock.update_attribute(:quantity, qty)
    elsif inventory.in_out_id == 2
      qty = stock.quantity + @inventory.inv_quantity
      stock.update_attribute(:quantity, qty)
    end
  end

end
