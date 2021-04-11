class CreateOpalColors < ActiveRecord::Migration[6.0]
  def change
    create_table :opal_colors do |t|
      t.string :color, null: false
      t.timestamps
    end
  end
end
