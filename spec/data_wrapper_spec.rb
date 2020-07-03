require_relative '../lib/data_wrapper'
require_relative '../lib/proxy'

describe DataWrapper do
  let(:proxy) { Proxy.new('123.0.1.22', '22', 'ZA', 'Egypt', 'anonymous', true) }
  let(:data) { [proxy] }
  let(:wrapper) { DataWrapper.new(data) }
  let(:empty_wrapper) { DataWrapper.new }
  describe '#initialization' do
    it 'sets arguments when arguments are provided' do
      expect(wrapper.data).to equal(data)
    end

    it 'sets default arguments when no arguments are provided' do
      expect(empty_wrapper.data).to eql([])
    end
  end

  describe '#add' do
    it 'appends an object to the data array' do
      temp_wrapper = DataWrapper.new
      temp_wrapper.add(proxy)

      expect(temp_wrapper.data).to eql([proxy])
    end
  end

  describe '#to_json' do
    it 'converts the data array to json' do
      expect(wrapper.to_json).to eql([{
        'ip' => '123.0.1.22',
        'port' => '22',
        'code' => 'ZA',
        'country' => 'Egypt',
        'anonymity' => 'anonymous',
        'https' => true
      }].to_json)
    end
  end
end
