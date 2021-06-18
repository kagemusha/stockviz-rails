class AnalysisResource < JSONAPI::Resource
  attributes :topic, :body

  def self.create(context)
    category = Category.find_by(name: 'stock')
    anly = AnalysisResource.new(context[:current_user].analyses.new(category: category), nil)
  end
end