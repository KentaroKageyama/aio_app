class OpalColor < ApplicationRecord

  validates :color, presence: true
  
  acts_as_list

  has_many :items
  has_many :glasses

end
