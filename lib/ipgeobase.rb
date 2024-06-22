# frozen_string_literal: true

require_relative "ipgeobase/version"
require "addressable/uri"
require "uri"
require "net/http"
require "happymapper"
require_relative "address"

module Ipgeobase
  class Error < StandardError; end

  def self.lookup(ip = "8.8.8.8")
    uri = URI("http://ip-api.com/xml/#{ip}")
    res = Net::HTTP.get_response(uri)
    Address.parse(res.body, single: true)
  end
end
