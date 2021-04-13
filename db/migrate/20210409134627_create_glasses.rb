class CreateGlasses < ActiveRecord::Migration[6.0]
  def change
    create_table :glasses do |t|
      t.string :name, null: false
      t.references :opal_color, foreign_key: true
      t.timestamps
    end
  end
end
