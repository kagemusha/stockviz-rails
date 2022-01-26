class Event < ApplicationRecord
  belongs_to :analysis
  validates :label, presence: true
  validates :edate, presence: true
  validates :magnitude, presence: true
  validates :magnitude, :inclusion => 1..3
  
end
