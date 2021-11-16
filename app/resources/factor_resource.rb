
class FactorResource < JSONAPI::Resource
  has_one :analysis
  attributes :ftype, :label, :desc, :positivity, :x, :y
end