class UserProfilesController < SecuredController

  # GET /user_profiles
  def index
    # if admin
    binding.pry 
    @user_profiles = UserProfile.all


    render json: @user_profiles
  end
end