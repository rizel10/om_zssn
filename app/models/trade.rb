class Trade < ApplicationRecord

  belongs_to :inventory_1, class_name: "Inventory"
  belongs_to :inventory_2, class_name: "Inventory", required: false

  validate :values_match, if: :inventories_present
  validates_associated :inventory_1
  validates_associated :inventory_2, if: :inventory_2

  before_save :update_survivors_stash, if: :inventories_present

  def inventories_present
  	inventory_1 and inventory_2  	
  end

  def values_match
    inventory_2.update_total_value
  	errors.add(:traded, "values don't match") unless inventory_1.total_value == inventory_2.total_value
  end

  def update_survivors_stash
    i1 = inventory_1.survivor.my_stash
    i2 = inventory_2.survivor.my_stash
    Item.item_types.keys.each do |i_type|
      i1.send(i_type + "=", (i1.send(i_type) - inventory_1.send(i_type) + inventory_2.send(i_type)))
      i2.send(i_type + "=", (i1.send(i_type) + inventory_1.send(i_type) - inventory_2.send(i_type)))
    end
    ActiveRecord::Base.transaction do
      i1.save!
      i2.save!
    end

  end
end
