class SecuredController < ApplicationController
  before_action :authorize_request
  attr_reader :current_user

  def context
    {current_user: @current_user}
  end

  private

  def authorize_request
    token = AuthorizationService.new(request.headers).authenticate_request!
    if token
      auth0_id = token[0]['sub']
      @current_user = UserProfile.find_or_create_by(auth0_id: auth0_id)
    end
  rescue JWT::VerificationError, JWT::DecodeError
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  end
end