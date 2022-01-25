
class EventResource < JSONAPI::Resource
  has_one :analysis
  attributes :etype, :label, :desc, :edate, :magnitude, :x, :y
end