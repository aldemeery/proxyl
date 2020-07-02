require 'json'

# Data wrapper.
class DataWrapper
  def initialize(data = {})
    @data = data
  end

  def empty?
    data.empty?
  end

  def to_json(*_args)
    @data.to_json
  end
end
