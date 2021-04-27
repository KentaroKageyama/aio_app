class Stock < ApplicationRecord

  validates :quantity, presence: true, numericality: true

  belongs_to :item
  has_many :inventories, dependent: :destroy
  accepts_nested_attributes_for :inventories

end
