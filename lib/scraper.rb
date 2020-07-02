require 'nokogiri'
require_relative './data_wrapper'
require_relative './proxy'

# The scraper.
class Scraper
  attr_reader :document, :data

  def initialize(document, data_wrapper = nil)
    @document = document
    @data = data_wrapper || DataWrapper.new
  end

  def scrape
    html = Nokogiri::HTML(@document)
    rows = html.css('#proxylisttable tbody tr')
    rows.each { |node| @data.add(parse_proxy(node)) }
  end

  private

  def parse_proxy(node)
    ip = node.elements[0].content
    port = node.elements[1].content
    code = node.elements[2].content
    country = node.elements[3].content
    anonymity = node.elements[4].content
    https = node.elements[6].content != 'no'

    Proxy.new(ip, port, code, country, anonymity, https)
  end
end
