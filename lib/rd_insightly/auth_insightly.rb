module RdInsightly
  class AuthInsightly
    @api_token = nil

    def self.create(api_token = nil)
      fail ApiTokenException if api_token.nil?
      @api_token = api_token
      @api_token = nil unless ApiInsightly.authentication
      @api_token
    end

    def self.api_token
      @api_token
    end

    def self.authorized?
      !@api_token.nil?
    end

    def self.loggout
      @api_token = nil
    end
  end
end
