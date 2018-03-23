class Survivor < ApplicationRecord
	has_many :reports # when I report another survivor
	has_many :reporteds, foreign_key: :reporter_id, class_name: "Report" # when I am reported by a survivor
	has_one :my_stash, -> { where(trade: nil) }, class_name: "Inventory"


	validates_presence_of :name, :age, :gender, :lat, :lng
	validates_uniqueness_of :name
	validates :lat, numericality: { greater_than_or_equal_to:  -90, less_than_or_equal_to:  90 }
  validates :lng, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }

  def infected
  	self.reporteds.size >= 3  	
  end

end
