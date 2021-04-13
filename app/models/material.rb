class Material < ApplicationRecord

  acts_as_list

  has_many :parts
  
  validates :name, presence: true

end
