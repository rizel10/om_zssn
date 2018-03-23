class SurvivorItem < ApplicationRecord
  belongs_to :inventory
  belongs_to :item

  validates :amount, numericality: { greater_than_or_equal_to: 0 }
  validates_uniqueness_of :item, scope: :inventory_id 

end
