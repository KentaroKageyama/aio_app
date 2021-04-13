class AddPositionToCollection < ActiveRecord::Migration[6.0]
  def change
    add_column :collections, :position, :integer, null: false
  end
end
