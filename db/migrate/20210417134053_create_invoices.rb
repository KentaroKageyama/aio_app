class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.date        :issue_date,    null: false
      t.integer     :issue_number,  null: false
      t.string      :content
      t.string      :client_name, null: false
      t.integer     :client_percentage, null: false
      t.timestamps
    end
  end
end
