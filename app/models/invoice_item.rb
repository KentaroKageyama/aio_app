class InvoiceItem < ApplicationRecord
  with_options presence: true do
    validates :chain_item
    with_options numericality: true do
      validates :price, :quantity
    end
  end

  belongs_to :invoice
end
