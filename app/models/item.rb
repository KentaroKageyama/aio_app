class Item < ApplicationRecord

  acts_as_list

  belongs_to :collection
  belongs_to :category
  belongs_to :opal_color
  has_one_attached :image

  has_many :item_parts, dependent: :destroy
  has_many :parts, through: :item_parts
  accepts_nested_attributes_for :item_parts


  has_many :item_glasses, dependent: :destroy
  has_many :glasses, through: :item_glasses
  accepts_nested_attributes_for :item_glasses


end
