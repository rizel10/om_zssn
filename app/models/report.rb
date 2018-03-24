class Report < ApplicationRecord
  belongs_to :survivor, counter_cache: true
  belongs_to :reporter, class_name: "Survivor", inverse_of: :reporteds

  validates_uniqueness_of :survivor, scope: :reporter_id, message: "can't be reported twice by the same person"
end
