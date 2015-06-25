module RdInsightly
  module ApiInsightly
    AUTHORIZED = true
    UNAUTHORIZED = false

    def self.authentication
      RestClient.get('https://api.insight.ly/v2.1/contacts', Authorization: authorization_string)
      AUTHORIZED
    rescue
      UNAUTHORIZED
    end

    def self.authorization_string
      "Basic #{Base64.encode64(RdInsightly.api_token)}"
    end
  end
end
