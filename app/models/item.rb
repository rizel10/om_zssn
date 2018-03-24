class Item < ApplicationRecord
	has_many :survivor_items

	# Enumerators
  enum item_type: [:water, :food, :medication, :ammunition]

	validates :value, numericality: { greater_than_or_equal_to: 0 }
	validates :item_type, inclusion: { in: Item.item_types.keys }
	validates_uniqueness_of :item_type
end
