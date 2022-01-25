class AnalysisResource < JSONAPI::Resource
  has_one :profile
  has_one :category
  has_many :factors
  has_many :events

  attributes :topic, :status

  before_create :set_user_profile

  def set_user_profile
    @model.profile = context[:current_user] 
    @model.category = Category.find_by(name: 'stock')
  end

  def category=(name='stock')    
    @model.category = Category.find_by(name: name)
  end

  def self.records(options = {})
    context = options[:context]
    context[:current_user].analyses
  end  

end


