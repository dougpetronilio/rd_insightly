module RdInsightly
  class ApiInsightly
    AUTHORIZATION = true
    UNAUTHORIZATION = false

    def self.authentication
      RestClient.get('https://api.insight.ly/v2.1/contacts', Authorization: authorization_string)
      AUTHORIZATION
    rescue
      UNAUTHORIZATION
    end

    def self.authorization_string
      "Basic #{Base64.encode64(Auth.api_token)}"
    end
  end
end
