module RdInsightly 
  class ApiInsightly

    AUTHORIZATION = true
    UNAUTHORIZATION = false

    def self.auth(api_token)
      authorization_string = "Basic #{Base64.encode64(api_token)}"
      begin 
        result = RestClient.get('https://api.insight.ly/v2.1/contacts', {Authorization: authorization_string, 'Accept' => 'application/json', 'Content-Type' => 'application/json'})
        AUTHORIZATION
      rescue
        UNAUTHORIZATION
      end
    end
  end
end
