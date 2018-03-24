class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.integer :item_type, null: false, default: 0
      t.integer :value, null: false, default: 1

      t.timestamps
    end
  end
end
