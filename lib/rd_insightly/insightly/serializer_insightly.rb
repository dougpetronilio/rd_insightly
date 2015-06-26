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
      Lead.new lead_json[LAST_NAME_FIELD], name: lead_json[NAME_FIELD], email: lead_json[EMAIL_FIELD], company: lead_json[COMPANY_FIELD], job_title: lead_json[JOB_TITLE_FIELD], phone: lead_json[PHONE_FIELD], website: lead_json[WEBSITE_FIELD]
    end
  end
end
