class Glass < ApplicationRecord

  acts_as_list

  has_many :item_glasses
  has_many :items, through: :item_glasses

  belongs_to :opal_color

end
