class AnalysisResource < JSONAPI::Resource
  attributes :topic, :status, :body

  def self.create(context)
    category = Category.find_by(name: 'stock')
    anly = AnalysisResource.new(context[:current_user].analyses.new(category: category), nil)
  end

  def self.records(options = {})
    context = options[:context]
    context[:current_user].analyses
  end  

end