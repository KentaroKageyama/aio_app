class StockInventory
  
  include ActiveModel::Model
  attr_accessor :item_id, :quantity, :date, :content, :inv_quantity, :in_out

  delegate :persisted?, to: :inventory

  def initialize(attributes = nil, inventory: Inventory.new)
    @inventory = inventory
    @stock = Stock.new
    if inventory.stock_id.present?
      @stock = Stock.find(@inventory.stock_id)
    end

    attributes ||= default_attributes
    super(attributes)
  end

  def save
    stock = Stock.find_by(item_id: item_id)
    calc_quantity = create_stock_calc(stock)
    stock.update_attribute(:quantity, calc_quantity)
    Inventory.create(stock_id: stock.id, date: date, content: content, inv_quantity: inv_quantity, in_out_id: in_out)
  end

  def update_save
    stock = Stock.find_by(item_id: item_id)
    calc_quantity = update_stock_calc(stock)
    stock.update_attribute(:quantity, calc_quantity)
    inventory.update(stock_id: stock.id, date: date, content: content, inv_quantity: inv_quantity, in_out_id: in_out)
  end

  def create_stock_calc(stock)
    if in_out == "1"
      calc_qty = stock.quantity + inv_quantity.to_i
    elsif in_out == "2"
      calc_qty = stock.quantity - inv_quantity.to_i
    end
    return calc_qty
  end

  def update_stock_calc(stock)
    if inventory.in_out_id == 1
      if in_out == "1"
        calc_qty = stock.quantity + (inv_quantity.to_i - inventory.inv_quantity)
      elsif in_out == "2"
        calc_qty = stock.quantity - (inv_quantity.to_i + inventory.inv_quantity)
      end
    elsif inventory.in_out_id == 2
      if in_out == "1"
        calc_qty = stock.quantity + (inv_quantity.to_i + inventory.inv_quantity)
      elsif in_out == "2"
        calc_qty = stock.quantity - (inv_quantity.to_i - inventory.inv_quantity)
      end
    end
    return calc_qty
  end

  def to_model
    inventory
  end


  private

  attr_reader :inventory, :stock

  def default_attributes
    {
      item_id: stock.item_id,
      quantity: stock.quantity,
      date: inventory.date,
      content: inventory.content,
      inv_quantity: inventory.inv_quantity,
      in_out: inventory.in_out_id
    }
  end

end