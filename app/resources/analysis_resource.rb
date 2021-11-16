class AnalysisResource < JSONAPI::Resource
  has_one :category
  has_many :factors

  attributes :topic, :status

  def self.create(context)
    category = Category.find_by(name: 'stock')
  end

  def self.records(options = {})
    context = options[:context]
    context[:current_user].analyses
  end  

end


