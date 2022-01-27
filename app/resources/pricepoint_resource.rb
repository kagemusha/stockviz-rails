
class PricepointResource < JSONAPI::Resource
  has_one :analysis
  attributes :pptype, :price, :label, :desc, :date
end