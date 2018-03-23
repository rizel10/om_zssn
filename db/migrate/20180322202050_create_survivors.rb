class CreateSurvivors < ActiveRecord::Migration[5.1]
  def change
    create_table :survivors do |t|
      t.string :name, null: false, unique: true
      t.integer :age, null: false
      t.integer :gender, null: false
      t.integer :reports_count
      # Decimals
      t.decimal :lat, null: true, precision: 10, scale: 6, null: false
      t.decimal :lng, null: true, precision: 10, scale: 6, null: false

      t.timestamps
    end
  end
end
