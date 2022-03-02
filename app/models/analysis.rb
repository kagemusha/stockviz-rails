class Analysis < ApplicationRecord
  belongs_to :profile
  belongs_to :category
  belongs_to :group, optional: true
  has_many :factors, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :pricepoints, dependent: :destroy

  validates :topic, uniqueness: { scope: ['profile_id', 'category_id', 'status'], case_sensitive: false}
  before_create :set_status_active

  def set_status_active
    self.status = 'active'
  end

end
