class Pricepoint < ApplicationRecord
  belongs_to :analysis
  # validates :price, presence: true
  # validates :date, presence: true
  # validates :label, presence: true
end
