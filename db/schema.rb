# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180322221311) do

  create_table "inventories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "survivor_id", null: false
    t.bigint "trade_id"
    t.integer "total_value", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survivor_id"], name: "index_inventories_on_survivor_id"
    t.index ["trade_id"], name: "index_inventories_on_trade_id"
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "item_type", default: 0, null: false
    t.integer "value", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "survivor_id", null: false
    t.bigint "reporter_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reporter_id"], name: "index_reports_on_reporter_id"
    t.index ["survivor_id"], name: "index_reports_on_survivor_id"
  end

  create_table "survivor_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "inventory_id", null: false
    t.bigint "item_id", null: false
    t.integer "amount", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inventory_id"], name: "index_survivor_items_on_inventory_id"
    t.index ["item_id"], name: "index_survivor_items_on_item_id"
  end

  create_table "survivors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.integer "age", null: false
    t.integer "gender", null: false
    t.integer "reports_count"
    t.decimal "lat", precision: 10, scale: 6
    t.decimal "lng", precision: 10, scale: 6
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trades", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "survivor_1_id", null: false
    t.bigint "survivor_2_id", null: false
    t.boolean "survivor_1_accepted", default: false
    t.boolean "survivor_2_accepted", default: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survivor_1_id"], name: "index_trades_on_survivor_1_id"
    t.index ["survivor_2_id"], name: "index_trades_on_survivor_2_id"
  end

  add_foreign_key "inventories", "survivors"
  add_foreign_key "inventories", "trades"
  add_foreign_key "reports", "survivors"
  add_foreign_key "survivor_items", "inventories"
  add_foreign_key "survivor_items", "items"
end
