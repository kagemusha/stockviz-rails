require 'net/http'
require 'uri'

class JsonWebToken
  def self.verify(token)
    JWT.decode(token, nil,
               true, # Verify the signature of this token
               algorithms: Rails.configuration.auth0.algorithms,
               iss: Rails.configuration.auth0.iss,
              #  iss: Rails.application.credentials.auth0[:domain],
               verify_iss: true,
               aud: Rails.application.secrets.auth0_api_audience,
               verify_aud: true) do |header|
      jwks_hash[header['kid']]
    end
  end

  def self.jwks_hash
    # jwks_raw = Net::HTTP.get URI("https://YOUR_DOMAIN/.well-known/jwks.json")
    jwks_raw = Net::HTTP.get URI(Rails.configuration.auth0.jwk_uri)
    jwks_keys = Array(JSON.parse(jwks_raw)['keys'])
    Hash[
      jwks_keys
      .map do |k|
        [
          k['kid'],
          OpenSSL::X509::Certificate.new(
            Base64.decode64(k['x5c'].first)
          ).public_key
        ]
      end
    ]
  end
end