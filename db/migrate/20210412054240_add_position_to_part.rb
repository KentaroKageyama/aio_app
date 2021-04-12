class AddPositionToPart < ActiveRecord::Migration[6.0]
  def change
    add_column :parts, :position, :integer
  end
end
