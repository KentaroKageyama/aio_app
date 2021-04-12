class AddPositionToGlass < ActiveRecord::Migration[6.0]
  def change
    add_column :glasses, :position, :integer
  end
end
