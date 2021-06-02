class Client < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :percentage, numericality: true, inclusion: { in: 0..100 }
  end
end
