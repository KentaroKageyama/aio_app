class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.string :chain_name, null: false, unique: true
      t.references :collection, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.references :opal_color, foreign_key: true
      t.references :material, foreign_key: true
      t.timestamps
    end
  end
end
