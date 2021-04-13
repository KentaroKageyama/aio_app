class ItemPart < ApplicationRecord
  
  belongs_to :item
  belongs_to :part

  validates :item_id, uniqueness: { scope: :part_id } 
  
end
