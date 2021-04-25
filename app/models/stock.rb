class Stock < ApplicationRecord

  belongs_to :item
  has_many :inventories
  accepts_nested_attributes_for :inventories

end
