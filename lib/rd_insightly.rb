require 'rd_insightly/version'
require 'rd_insightly/lead'
require 'rd_insightly/exception/lead_exception'
require 'rd_insightly/exception/api_token_exception'
require 'rd_insightly/auth'
require 'rd_insightly/insightly/api_insightly'
require 'rest-client'
require 'base64'
require 'singleton'

module RdInsightly
  @auth = nil
  def self.create_authorization(api_token)
    @auth = Auth.create(api_token)
  end

  def self.authorized?
    @auth.authorized?
  end

  def self.api_token
    @auth.api_token
  end
end
