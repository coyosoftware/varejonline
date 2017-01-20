require 'spec_helper'

RSpec.describe Varejonline::API::ClientClasses do
  let(:header) { {'Content-Type' => 'application/json', 'Accept' => 'application/json'} }
  
  describe '.list' do
    before do
      stub_request(:get, "#{Varejonline::API_ADDRESS}/classificacoes-clientes/").to_return(status: 200)
    end
    
    it 'issues a get to the client classes url' do
      expect(described_class).to receive(:get).with('/', body: { token: 'abc' }.to_json, headers: header).and_call_original
      
      Varejonline.new('abc').client_classes.list()
    end
    
    it 'issues a get to the client classes url using the searcher' do
      searcher = Varejonline::Searcher::Operational::ClientClassSearcher.new({ quantidade: 10, inicio: 0 })
      
      expect(described_class).to receive(:get).with('/', body: searcher.as_parameter.merge!({ token: 'abc' }).to_json, headers: header).and_call_original
      
      Varejonline.new('abc').client_classes.list(searcher)
    end
    
    it 'raise ArgumentError if the parameter is not a ClientClassSearcher' do
      expect{ Varejonline.new('abc').client_classes.list(Array.new) }.to raise_error(ArgumentError)
    end
  end
  
  describe '.find' do
    before do
      stub_request(:get, "#{Varejonline::API_ADDRESS}/classificacoes-clientes/5").to_return(status: 200)
    end
    
    it 'issues a get to the client classes url' do
      expect(described_class).to receive(:get).with('/5', body: { token: 'abc' }.to_json, headers: header).and_call_original
      
      Varejonline.new('abc').client_classes.find(5)
    end
  end
end