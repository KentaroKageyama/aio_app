class Material < ApplicationRecord
  validates :name, presence: true

  acts_as_list

  has_many :parts
  has_many :items
end
