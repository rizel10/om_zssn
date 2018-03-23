class Report < ApplicationRecord
  belongs_to :survivor
  belongs_to :reporter
end
