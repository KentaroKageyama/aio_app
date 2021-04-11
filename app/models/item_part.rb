class ItemPart < ApplicationRecord
  
  belongs_to :item
  belongs_to :part
  
end
