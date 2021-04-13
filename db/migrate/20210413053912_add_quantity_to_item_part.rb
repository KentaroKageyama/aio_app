class AddQuantityToItemPart < ActiveRecord::Migration[6.0]
  def change
    add_column :item_parts, :quantity, :integer, null: false
  end
end
