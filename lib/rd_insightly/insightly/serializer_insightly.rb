module RdInsightly
  module SerializerInsightly
    LAST_NAME_FIELD = 'LAST_NAME'
    NAME_FIELD = 'FIRST_NAME'
    EMAIL_FIELD = 'EMAIL_ADDRESS'
    COMPANY_FIELD = 'ORGANIZATION_NAME'
    JOB_TITLE_FIELD = 'TITLE'
    PHONE_FIELD = 'PHONE_NUMBER'
    WEBSITE_FIELD = 'WEBSITE_URL'
    ID_FIELD = 'LEAD_ID'
    FIELDS = [NAME_FIELD, EMAIL_FIELD, COMPANY_FIELD, JOB_TITLE_FIELD, PHONE_FIELD, WEBSITE_FIELD, ID_FIELD]

    def self.lead(lead_json)
      Lead.new lead_json[LAST_NAME_FIELD], name: lead_json[NAME_FIELD], email: lead_json[EMAIL_FIELD], company: lead_json[COMPANY_FIELD], job_title: lead_json[JOB_TITLE_FIELD], phone: lead_json[PHONE_FIELD], website: lead_json[WEBSITE_FIELD], id: lead_json[ID_FIELD]
    end

    def self.lead_to_hash(lead)
      lead_hash = {}
      lead_hash[LAST_NAME_FIELD] = lead.last_name
      lead_hash = get_values_not_required(lead_hash, lead)
      lead_hash.delete_if { |_key, value| value.nil? }
      lead_hash
    end

    def self.get_values_not_required(lead_hash, lead)
      lead_hash[NAME_FIELD] = lead.name
      lead_hash[EMAIL_FIELD] = lead.email
      lead_hash[COMPANY_FIELD] = lead.company
      lead_hash[JOB_TITLE_FIELD] = lead.job_title
      lead_hash[PHONE_FIELD] = lead.phone
      lead_hash[WEBSITE_FIELD] = lead.website
      lead_hash[ID_FIELD] = lead.id
      lead_hash
    end
  end
end
