class ProfilesController < SecuredController
  # attr_reader :current_user

  def update
    profile = @current_user
    attrs = params[:data][:attributes]
    safe_attrs = {screen_name: attrs["screen-name"], email: attrs["email"]} 
    profile.update!(safe_attrs)
    #error handling?
    head :ok
  end

end
