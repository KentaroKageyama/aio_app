class AddQuantityToItemGlass < ActiveRecord::Migration[6.0]
  def change
    add_column :item_glasses, :quantity, :integer, null: false
  end
end
