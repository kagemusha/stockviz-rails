class AnalysisResource < JSONAPI::Resource
  has_one :profile
  has_one :category
  has_many :factors
  has_many :events
  has_many :pricepoints

  attributes :topic, :status

  before_create :set_user_profile

  def set_user_profile
    @model.category = Category.find_by(name: 'stock')
    @model.profile = context[:current_user] 
  end

  def category=(name='stock')    
    @model.category = Category.find_by(name: name)
  end

  def self.records(options = {})
    context = options[:context]
    context[:current_user].analyses
  end  

end


