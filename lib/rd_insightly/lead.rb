module RdInsightly
  class Lead
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def self.create(name = nil)
      fail LeadException if name.nil?
      fail ApiTokenException unless RdInsightly.authorized?
      Lead.new name
    end

    def self.all
      fail ApiTokenException unless RdInsightly.authorized?
      [1]
    end
  end
end
