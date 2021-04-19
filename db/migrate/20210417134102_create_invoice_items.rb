class CreateInvoiceItems < ActiveRecord::Migration[6.0]
  def change
    create_table :invoice_items do |t|
      t.references :invoice,    null: false, foreign_key: true
      t.string     :chain_item, null: false
      t.string     :size
      t.integer    :price,      null: false
      t.integer    :quantity,   null: false
      t.timestamps
    end
  end
end
