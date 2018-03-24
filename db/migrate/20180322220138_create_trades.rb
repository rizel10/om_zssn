class CreateTrades < ActiveRecord::Migration[5.1]
  def change
    create_table :trades do |t|
      t.references :inventory_1, null: false
      t.references :inventory_2
      t.timestamps
    end
  end
end
