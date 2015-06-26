module RdInsightly
  module SerializerInsightly
    LAST_NAME_FIELD = 'LAST_NAME'
    NAME_FIELD = 'FIRST_NAME'
    EMAIL_FIELD = 'EMAIL_ADDRESS'
    COMPANY_FIELD = 'ORGANIZATION_NAME'
    JOB_TITLE_FIELD = 'TITLE'
    PHONE_FIELD = 'PHONE_NUMBER'
    WEBSITE_FIELD = 'WEBSITE_URL'

    def self.lead(lead_json)
      Lead.new lead_json[LAST_NAME_FIELD]
    end
  end
end
