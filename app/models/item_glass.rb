class ItemGlass < ApplicationRecord

  validates :item_id, uniqueness: { scope: :glass_id } # 複合一意制約
  validates :quantity, presence: true, numericality: true

  belongs_to :item
  belongs_to :glass

end
