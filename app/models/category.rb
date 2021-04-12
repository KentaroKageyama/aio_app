class Category < ApplicationRecord

  acts_as_list

  has_many :items
  
end
