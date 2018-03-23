class CreateInventories < ActiveRecord::Migration[5.1]
  def change
    create_table :inventories do |t|
      t.references :survivor, foreign_key: true, null: false
      t.references :trade, foreign_key: true
      t.integer :total_value, null: false, default: 0

      t.timestamps
    end
  end
end
