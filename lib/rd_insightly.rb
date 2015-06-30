require 'rd_insightly/version'
require 'rd_insightly/lead'
require 'rd_insightly/exception/lead_exception'
require 'rd_insightly/exception/api_token_exception'
require 'rd_insightly/auth'
require 'rd_insightly/insightly/api_insightly'
require 'rd_insightly/insightly/serializer_insightly'
require 'rest-client'
require 'base64'
require 'singleton'

module RdInsightly
  BASE_URL = 'https://api.insight.ly/v2.1/'
  @auth = nil

  def self.create_authorization(api_token)
    @auth = Auth.create(api_token)
  end

  def self.authorized?
    return false if @auth.nil?
    @auth.authorized?
  end

  def self.api_token
    @auth.api_token
  end

  def self.logout
    @auth.logout
  end
end
