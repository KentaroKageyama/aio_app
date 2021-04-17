class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string     :name,          null: false
      t.integer    :percentage,    null: false
      t.references :user,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
