module RdInsightly
  class Lead
    attr_reader :name, :last_name, :email, :company, :job_title, :phone, :website

    def initialize(last_name = nil, attributes = {})
      @last_name = last_name
      @name = attributes.fetch(:name, nil)
      @email = attributes.fetch(:email, nil)
      @company = attributes.fetch(:company, nil)
      @job_title = attributes.fetch(:job_title, nil)
      @phone = attributes.fetch(:phone, nil)
      @website = attributes.fetch(:website, nil)
    end

    def self.create(last_name = nil, attributes = {})
      fail LeadException if last_name.nil?
      fail ApiTokenException unless RdInsightly.authorized?
      Lead.new last_name, attributes
    end

    def self.all
      fail ApiTokenException unless RdInsightly.authorized?
      ApiInsightly.leads
    end
  end
end
