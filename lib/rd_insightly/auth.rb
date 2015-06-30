module RdInsightly
  class Auth
    attr_accessor :api_token

    def initialize(api_token)
      @api_token = api_token
    end

    def self.create(api_token = nil)
      fail ApiTokenException if api_token.nil?
      Auth.new(api_token)
    end

    def authorized?
      @api_token = nil unless ApiInsightly.authentication
      !@api_token.nil?
    end

    def logout
      @api_token = nil
    end
  end
end
