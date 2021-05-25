class Client < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :percentage, numericality: true
  end
end
