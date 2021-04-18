class AddChainNameToItem < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :chain_name, :string, null: false, unique: true
  end
end
