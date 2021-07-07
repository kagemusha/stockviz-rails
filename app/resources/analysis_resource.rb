class AnalysisResource < JSONAPI::Resource
  has_one :analysis_body
  has_one :category

  attributes :topic, :status

  def self.create(context)
    category = Category.find_by(name: 'stock')
    abody = AnalysisBody.create({})
    anly = AnalysisResource.new(context[:current_user].analyses.new(category: category, body: abody), nil)
  end

  def self.records(options = {})
    context = options[:context]
    context[:current_user].analyses
  end  

end