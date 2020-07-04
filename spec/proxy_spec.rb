describe Proxy do
  let(:proxy) { Proxy.new('123.0.1.22', '22', 'ZA', 'Egypt', 'anonymous', true) }

  describe '#initialization' do
    it 'sets arguments when arguments correctly' do
      expect(proxy).to have_attributes({
                                         ip: '123.0.1.22',
                                         port: '22',
                                         code: 'ZA',
                                         country: 'Egypt',
                                         anonymity: 'anonymous',
                                         https: true
                                       })
    end
  end

  describe '#to_json' do
    it 'converts the proxy object to json' do
      expect(proxy.to_json).to eql({
        'ip' => '123.0.1.22',
        'port' => '22',
        'code' => 'ZA',
        'country' => 'Egypt',
        'anonymity' => 'anonymous',
        'https' => true
      }.to_json)
    end
  end
end
