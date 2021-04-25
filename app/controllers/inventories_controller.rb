class InventoriesController < ApplicationController

  def destroy
    inventory = Inventory.find(params[:id])
    inventory.destroy
    redirect_to stocks_path
  end

end
