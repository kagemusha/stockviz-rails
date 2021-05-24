class Analysis < ApplicationRecord
  belongs_to :user_profile
  belongs_to :category
  belongs_to :group, optional: true

  validates :topic, uniqueness: true
end
