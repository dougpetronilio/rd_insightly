module RdInsightly
  class AuthInsightly
    def initialize(api_token)
      api_token = nil unless ApiInsightly.authentication(api_token)
      @api_token = api_token
    end

    def self.create(api_token = nil)
      fail ApiTokenException if api_token.nil?
      AuthInsightly.new(api_token)
    end

    def self.loggout
      @api_token = nil
    end

    def authorized
      !@api_token.nil?
    end
  end
end
