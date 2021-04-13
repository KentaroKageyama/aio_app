class ItemGlass < ApplicationRecord

  belongs_to :item
  belongs_to :glass

  validates :item_id, uniqueness: { scope: :glass_id } 
end
