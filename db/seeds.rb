# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Create default settings

def light_blue(str)
  "\e[36m#{str}\e[0m"
end

def green(str)
  "\e[32m#{str}\e[0m"
end

def bold(str)
  "\e[1m#{str}\e[22m"
end

print bold(light_blue("\n\ncreating items..."))
Item.create!([
	{ value: 4, item_type: Item.item_types["water"] },
	{ value: 3, item_type: Item.item_types["food"] },
	{ value: 2, item_type: Item.item_types["medication"] },
	{ value: 1, item_type: Item.item_types["ammunition"] }
	])
print bold(green("\ndone!\n"))