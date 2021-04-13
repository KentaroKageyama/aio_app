class AddPositionToOpalColor < ActiveRecord::Migration[6.0]
  def change
    add_column :opal_colors, :position, :integer, null: false
  end
end
