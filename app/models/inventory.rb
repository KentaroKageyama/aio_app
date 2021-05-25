class Inventory < ApplicationRecord
  belongs_to :stock

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :in_out
end
