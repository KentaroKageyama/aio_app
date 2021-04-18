class Material < ApplicationRecord

  acts_as_list

  has_many :parts
  has_many :items
  
  validates :name, presence: true

end
