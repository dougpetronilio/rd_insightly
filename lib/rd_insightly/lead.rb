module RdInsightly
  class Lead
    attr_accessor :name, :last_name, :email, :company, :job_title, :phone, :website, :id

    def initialize(last_name = nil, attributes = {})
      @last_name = last_name
      @name = attributes.fetch(:name, nil)
      @email = attributes.fetch(:email, nil)
      @company = attributes.fetch(:company, nil)
      @job_title = attributes.fetch(:job_title, nil)
      @phone = attributes.fetch(:phone, nil)
      @website = attributes.fetch(:website, nil)
      @id = attributes.fetch(:id, nil)
    end

    def self.create(last_name = nil, attributes = {})
      fail LeadException if last_name.nil?
      fail ApiTokenException unless RdInsightly.authorized?
      lead = Lead.new last_name, attributes
      ApiInsightly.create_lead(lead)
    end

    def self.all
      fail ApiTokenException unless RdInsightly.authorized?
      leads_result = []
      leads_json = ApiInsightly.leads
      leads_json.each do |lead_json|
        leads_result << SerializerInsightly.lead(lead_json)
      end
      leads_result
    end

    def self.find(id)
      fail ApiTokenException unless RdInsightly.authorized?
      ApiInsightly.find_lead id
    end

    def delete
      fail ApiTokenException unless RdInsightly.authorized?
      ApiInsightly.delete_lead @id
    end

    def update(lead_changes)
      fail ApiTokenException unless RdInsightly.authorized?

      lead_changes[:id] = @id
      hash_to_lead(lead_changes)

      ApiInsightly.update_lead self
    end

    def hash_to_lead(lead_changes)
      lead_changes.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end
  end
end
