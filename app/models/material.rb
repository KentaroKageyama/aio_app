class Material < ApplicationRecord

  acts_as_list

  has_many :parts
  
end
