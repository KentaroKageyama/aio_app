class OpalColor < ApplicationRecord
  
  acts_as_list

  has_many :items
  has_many :glasses

  validates :color, presence: true

end
