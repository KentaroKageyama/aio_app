class ItemPart < ApplicationRecord
  validates :item_id, uniqueness: { scope: :part_id } # 複合一意制約
  validates :quantity, presence: true, numericality: true

  belongs_to :item
  belongs_to :part
end
