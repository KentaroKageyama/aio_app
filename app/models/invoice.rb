class Invoice < ApplicationRecord

  with_options presence: true do
    validates :issue_date
    validates :issue_number, numericality: true
    validates :content, :client_name, :client_percentage
  end

  has_many :invoice_items, dependent: :destroy
  accepts_nested_attributes_for :invoice_items

end
