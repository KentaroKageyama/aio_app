class AddTestToItemPart < ActiveRecord::Migration[6.0]
  def change
    add_column :item_parts, :test, :integer
  end
end
