# frozen_string_literal: true

# BEGIN
require 'uri'
require 'forwardable'

class Url
  include Comparable
  extend Forwardable

  def initialize(address)
    @uri = URI(address)
  end

  def ==(other)
    return false unless other.is_a?(Url)

    scheme == other.scheme &&
      host == other.host &&
      port == other.port &&
      query_params == other.query_params
  end

  def_delegators :@uri, :scheme, :host, :port

  def query_params
    params = {}
    @uri.query&.split('&')&.each do |pair|
      key, value = pair.split('=')
      params[key.to_sym] = value
    end
    params
  end

  def query_param(name, default_value = nil)
    query_params[name] || default_value
  end
end
# END
