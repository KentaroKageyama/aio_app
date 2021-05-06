class Invoice < ApplicationRecord

  with_options presence: true do
    validates :issue_date
    validates :issue_number, numericality: true
    validates :content, :client_name, :client_percentage
  end

  has_many :invoice_items, dependent: :destroy
  accepts_nested_attributes_for :invoice_items

  def calc_billing_total
    invoice_items = InvoiceItem.where(invoice_id: self.id)
    sum = 0
    invoice_items.each do |invoice_item|
      sum += invoice_item.price * invoice_item.quantity
    end
    return (sum * 1.1 * self.client_percentage / 100).floor.to_s(:delimited)
  end

end
