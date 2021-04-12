class Part < ApplicationRecord

  acts_as_list

  has_many :item_parts
  has_many :items, through: :item_parts
  belongs_to :material

end
