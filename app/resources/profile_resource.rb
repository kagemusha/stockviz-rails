
class ProfileResource < JSONAPI::Resource
  attributes :screen_name, :categories, :analyses

  singleton singleton_key: -> (context) {
    key = context[:current_user].id
    raise JSONAPI::Exceptions::RecordNotFound.new(nil) if key.nil?
    key
  }

  def categories
    #eventually include user-defined categories
    Category.pluck_to_hash(:id, :name)
  end

  def analyses
    context[:current_user].analyses.pluck_to_hash(:id, :topic)
  end

end