module RdInsightly
  class ApiInsightly
    AUTHORIZATION = true
    UNAUTHORIZATION = false

    def self.authentication(api_token)
      authorization_string = "Basic #{Base64.encode64(api_token)}"
      begin
        RestClient.get('https://api.insight.ly/v2.1/contacts', Authorization: authorization_string)
        AUTHORIZATION
      rescue
        UNAUTHORIZATION
      end
    end
  end
end
