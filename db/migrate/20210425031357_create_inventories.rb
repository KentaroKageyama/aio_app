class CreateInventories < ActiveRecord::Migration[6.0]
  def change
    create_table :inventories do |t|
      t.references :stock,    null: false, foreign_key: true
      t.date       :date,     null: false
      t.string     :content
      t.integer    :quantity, null: false
      t.integer    :in_out,   null: false, default: 0
      t.timestamps
    end
  end
end