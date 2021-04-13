class AddPositionToItem < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :position, :integer, null: false
  end
end
