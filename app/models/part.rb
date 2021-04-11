class Part < ApplicationRecord

  has_many :item_parts
  has_many :items, through: :item_parts
  belongs_to :material

end
