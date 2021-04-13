class AddPositionToMaterial < ActiveRecord::Migration[6.0]
  def change
    add_column :materials, :position, :integer, null: false
  end
end
