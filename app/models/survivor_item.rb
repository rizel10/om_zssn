class SurvivorItem < ApplicationRecord
  belongs_to :survivor
  belongs_to :item

  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
