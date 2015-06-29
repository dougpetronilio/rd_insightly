module RdInsightly
  module ApiInsightly
    AUTHORIZED = true
    UNAUTHORIZED = false

    def self.authentication
      RestClient.get('https://api.insight.ly/v2.1/contacts', Authorization: authorization_string, accept: :json)
      AUTHORIZED
    rescue
      UNAUTHORIZED
    end

    def self.leads
      JSON.parse(RestClient.get('https://api.insight.ly/v2.1/leads', Authorization: authorization_string, accept: :json))
    rescue
      nil
    end

    def self.create_lead(lead)
      lead_hash = SerializerInsightly.lead_to_hash(lead)
      RestClient.post('https://api.insight.ly/v2.1/leads', lead_hash.to_json, Authorization: authorization_string, accept: :json, content_type: :json)
      lead
    end

    def self.delete_lead(lead_id)
      RestClient.delete("https://api.insight.ly/v2.1/leads/#{lead_id}", Authorization: authorization_string, accept: :json, content_type: :json)
    rescue
      raise LeadException, 'Lead não pode ser excluido!'
    end

    def self.find_lead(lead_id)
      lead_json = JSON.parse(RestClient.get("https://api.insight.ly/v2.1/leads/#{lead_id}", Authorization: authorization_string, accept: :json))
      SerializerInsightly.lead(lead_json)
    rescue
      raise LeadException, 'Lead não foi encontrado!'
    end

    def self.authorization_string
      "Basic #{Base64.encode64(RdInsightly.api_token)}"
    end
  end
end
