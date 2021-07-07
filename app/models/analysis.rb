class Analysis < ApplicationRecord
  belongs_to :user_profile
  belongs_to :category
  belongs_to :group, optional: true
  belongs_to :analysis_body

  validates :topic, uniqueness: true
end
