module RdInsightly
  class Lead
    attr_reader :name, :last_name, :email, :company, :job_title, :phone, :website

    def initialize(last_name = nil, name = nil, email = nil, company = nil, job_title = nil, phone = nil, website = nil)
      @last_name = last_name
      @name = name
      @email = email
      @company = company
      @job_title = job_title
      @phone = phone
      @website = website
    end

    def self.create(last_name = nil, name = nil, email = nil, company = nil, job_title = nil, phone = nil, website = nil)
      fail LeadException if last_name.nil?
      fail ApiTokenException unless RdInsightly.authorized?
      Lead.new last_name, name, email, company, job_title, phone, website
    end

    def self.all
      fail ApiTokenException unless RdInsightly.authorized?
      ApiInsightly.leads
    end
  end
end
