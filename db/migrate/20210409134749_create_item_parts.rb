class CreateItemParts < ActiveRecord::Migration[6.0]
  def change
    create_table :item_parts do |t|
      t.references :item, null: false, foreign_key: true
      t.references :part, null: false, foreign_key: true
      t.timestamps
    end
  end
end
