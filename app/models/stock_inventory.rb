class StockInventory
  
  include ActiveModel::Model
  attr_accessor :item_id, :quantity, :date, :content, :inv_quantity, :in_out

  def save
    stock = Stock.find_by(item_id: item_id)
    calc_quantity = stock_calc(stock.quantity)
    stock.update(quantity: calc_quantity)
    Inventory.create(stock_id: stock.id, date: date, content: content, inv_quantity: inv_quantity, in_out_id: in_out)
  end

  private

  def stock_calc(qty)
    if in_out == "1"
      calc_qty = qty.to_i + inv_quantity.to_i
    elsif in_out == "2"
      calc_qty = qty.to_i - inv_quantity.to_i
    end
    return calc_qty.to_s
  end

end