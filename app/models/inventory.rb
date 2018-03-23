class Inventory < ApplicationRecord

	
  Item.item_types.keys.each do |i_type|
    define_method :"#{i_type}" do
      i = Item.find_by_item_type(i_type)
      s_item = survivor_items.find_by_item_id(i.id)
      s_item.nil? ? 0 : s_item.amount
    end

    define_method :"#{i_type}=" do |value|
      i = Item.find_by_item_type(i_type)
      s_items = survivor_items.where(item_id: i.id)
      s_item_id = s_items.any? ? s_items.first.id : nil
      self.survivor_items_attributes = { id: s_item_id, amount: value, item: i }
    end
  end
  

  belongs_to :survivor
  belongs_to :trade, required: false

  has_many :survivor_items
  accepts_nested_attributes_for :survivor_items

  validates :total_value, numericality: { greater_than_or_equal_to: 0 }

  # Callbacks
  before_save :update_total_value

  def update_total_value
  	val = 0
  	survivor_items.each do |i|
  		val+= i.amount * i.item.value
  	end
  	self.total_value = val
  end

end
