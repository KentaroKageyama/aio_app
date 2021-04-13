class CreateItemParts < ActiveRecord::Migration[6.0]
  def change
    create_table :item_parts do |t|
      t.references :item, null: false, foreign_key: true
      t.references :part, null: false, foreign_key: true
      t.timestamps
    end
    add_index :item_parts, [:item_id, :part_id], unique: true
  end
end
