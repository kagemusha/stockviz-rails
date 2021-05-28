class AuthorizationService

  def initialize(headers = {})
    @headers = headers
  end

  def authenticate_request!
    verify_token
  end

  private

  def http_token
    if @headers['Authorization'].present?
      @headers['Authorization'].split(' ').last
    end
  end

  def verify_token
    token = JsonWebToken.verify(http_token)
    auth0_id = token[0]['sub']
    binding.pry
    return token
  end

end