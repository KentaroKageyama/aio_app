class Category < ApplicationRecord

  validates :name, presence: true

  acts_as_list

  has_many :items
  
end
