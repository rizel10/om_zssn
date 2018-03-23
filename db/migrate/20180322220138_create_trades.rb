class CreateTrades < ActiveRecord::Migration[5.1]
  def change
    create_table :trades do |t|
      t.references :survivor_1, null: false
      t.references :survivor_2, null: false
      t.boolean :survivor_1_accepted, default: false
      t.boolean :survivor_2_accepted, default: false
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end
