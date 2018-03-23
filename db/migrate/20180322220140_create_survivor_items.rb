class CreateSurvivorItems < ActiveRecord::Migration[5.1]
  def change
    create_table :survivor_items do |t|
      t.references :inventory, foreign_key: true, null: false
      t.references :item, foreign_key: true, null: false
      t.integer :amount, null: false, default: 0

      t.timestamps
    end
  end
end
