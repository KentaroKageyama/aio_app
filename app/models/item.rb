class Item < ApplicationRecord

  belongs_to :collection
  belongs_to :category
  belongs_to :opal_color

  has_many :item_parts
  has_many :parts, through: :item_parts

  has_many :item_glasses
  has_many :glasses, through: :item_glasses

end
