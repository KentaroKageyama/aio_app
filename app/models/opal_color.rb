class OpalColor < ApplicationRecord

  has_many :items
  has_many :glasses

  acts_as_list
  
end
