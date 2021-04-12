class CreateItemGlasses < ActiveRecord::Migration[6.0]
  def change
    create_table :item_glasses do |t|
      t.references :item, null: false, foreign_key: true
      t.references :glass, null: false, foreign_key: true
      t.timestamps
    end
  end
end