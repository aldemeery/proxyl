require_relative './data_wrapper'

# The scrapper.
class Scrapper
  attr_reader :document, :data

  def initialize(document, data_wrapper = nil)
    @document = document
    @data = data_wrapper || DataWrapper.new
  end

  def scrape
    sleep(2)
  end
end
