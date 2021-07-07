class AnalysisBodyResource < JSONAPI::Resource
  has_one :analysis
  attributes :body
end