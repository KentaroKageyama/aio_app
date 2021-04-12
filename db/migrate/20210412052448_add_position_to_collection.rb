class AddPositionToCollection < ActiveRecord::Migration[6.0]
  def change
    add_column :collections, :position, :integer
  end
end
