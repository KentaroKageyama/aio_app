class Item < ApplicationRecord

  with_options presence: true do
    validates :chain_name, uniqueness: true
    validates :name
    validates :price, numericality: true
  end

  acts_as_list

  belongs_to :collection
  belongs_to :category
  belongs_to :material, optional: true
  belongs_to :opal_color, optional: true
  has_one_attached :image

  has_many :item_parts, dependent: :destroy
  has_many :parts, through: :item_parts
  accepts_nested_attributes_for :item_parts

  has_many :item_glasses, dependent: :destroy
  has_many :glasses, through: :item_glasses
  accepts_nested_attributes_for :item_glasses

  has_one :stock, dependent: :destroy
  accepts_nested_attributes_for :stock

end
