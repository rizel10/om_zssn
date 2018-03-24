class Survivor < ApplicationRecord
	
	has_many :reports  # when I am reported by a survivor
	has_many :reporteds, class_name: "Report", foreign_key: :reporter_id, inverse_of: :reporter # when I report another survivor
	has_many :inventories
	has_many :trade_inventories, -> { where.not(trade: nil) }, class_name: "Inventory"
	has_one :my_stash, -> { where(trade: nil) }, class_name: "Inventory"

	accepts_nested_attributes_for :inventories

	enum gender: [:male, :female, :undefined]


	validates_presence_of :name, :age, :gender, :lat, :lng
	validates_uniqueness_of :name
	validates :age, numericality: { greater_than_or_equal_to: 0 }
	validates :gender, inclusion: { in: Survivor.genders.keys }
	validates :lat, numericality: { greater_than_or_equal_to:  -90, less_than_or_equal_to:  90 }
  validates :lng, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }

  def infected
  	self.reports_count >= 3  	
  end

  def infected?
  	infected
  end

  def personal_stash=(stash_json) # custom method to receive a user's personal stash on registration
  	stash = inventories.new stash_json #TODO: investigate why nested attributes did not work
  end

end
