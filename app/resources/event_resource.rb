
class EventResource < JSONAPI::Resource
  has_one :analysis
  attributes :etype, :label, :desc, :edate, :magnitude
end