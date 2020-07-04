# rubocop:disable Metrics/ParameterLists:

require 'json'
# Proxy object representation.
class Proxy
  attr_reader :ip, :port, :code, :country, :anonymity, :https

  def initialize(ip, port, code, country, anonymity, https)
    @ip = ip
    @port = port
    @code = code
    @country = country
    @anonymity = anonymity
    @https = https
  end

  def to_json(*args)
    {
      'ip' => @ip,
      'port' => @port,
      'code' => @code,
      'country' => @country,
      'anonymity' => @anonymity,
      'https' => @https
    }.to_json(*args)
  end
end

# rubocop:enable Metrics/ParameterLists:
