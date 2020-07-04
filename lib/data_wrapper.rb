require 'json'

# Data wrapper.
class DataWrapper
  attr_reader :data

  def initialize(data = [])
    @data = data
  end

  def add(object)
    @data << object
  end

  def to_json(*args)
    @data.to_json(*args)
  end
end
