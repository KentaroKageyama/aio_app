class CreateInvoiceItems < ActiveRecord::Migration[6.0]
  def change
    create_table :invoice_items do |t|
      t.references :invoice,  null: false, foreign_key: true
      t.references :item,     null: false, foreign_key: true
      t.integer    :quantity, null: false
      t.timestamps
    end
  end
end
