module RdInsightly
  class Lead
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def self.create(name = nil)
      fail LeadException if name.nil?
      fail ApiTokenException unless AuthInsightly.authorized
      Lead.new name
    end
  end
end
