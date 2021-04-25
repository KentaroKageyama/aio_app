class Inventory < ApplicationRecord

  belongs_to :stock

  enum in_out: { in_stock: 0, out_stock: 1 }

end
