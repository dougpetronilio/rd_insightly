module RdInsightly
  class ApiInsightly
    AUTHORIZATION = true
    UNAUTHORIZATION = false

    def self.authentication
      begin
        RestClient.get('https://api.insight.ly/v2.1/contacts', Authorization: authorization_string)
        AUTHORIZATION
      rescue Exception => e
        UNAUTHORIZATION
      end
    end

    def self.authorization_string
      "Basic #{Base64.encode64(AuthInsightly.api_token)}"
    end
  end
end
