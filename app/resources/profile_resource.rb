
class ProfileResource < JSONAPI::Resource
  has_many :analyses
  attributes :screen_name, :categories

  singleton singleton_key: -> (context) {
    key = context[:current_user].id
    raise JSONAPI::Exceptions::RecordNotFound.new(nil) if key.nil?
    key
  }

  def categories
    #eventually include user-defined categories
    Category.pluck_to_hash(:id, :name)
  end

end