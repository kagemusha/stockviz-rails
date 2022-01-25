class Analysis < ApplicationRecord
  belongs_to :profile
  belongs_to :category
  belongs_to :group, optional: true
  has_many :factors, dependent: :destroy
  has_many :events, dependent: :destroy

  validates :topic, uniqueness: true
end
