require 'spec_helper'

RSpec.describe Varejonline::API::Entities do
  let(:header) { {'Content-Type' => 'application/json', 'Accept' => 'application/json'} }
  
  describe '.list' do
    before do
      stub_request(:get, "#{Varejonline::API_ADDRESS}/entidades/").to_return(status: 200)
    end
    
    it 'issues a get to the entities url' do
      expect(described_class).to receive(:get).with('/', body: { token: 'abc' }.to_json, headers: header).and_call_original
      
      Varejonline.new('abc').entities.list()
    end
    
    it 'issues a get to the entities url using the searcher' do
      searcher = Varejonline::Searcher::Administrative::EntitySearcher.new({ quantidade: 10, inicio: 0 })
      
      expect(described_class).to receive(:get).with('/', body: searcher.as_parameter.merge!({ token: 'abc' }).to_json, headers: header).and_call_original
      
      Varejonline.new('abc').entities.list(searcher)
    end
    
    it 'raises ArgumentError if the parameter is not a EntitySearcher' do
      expect{Varejonline.new('abc').entities.list(Array.new)}.to raise_error(ArgumentError)
    end
  end
  
  describe '.find' do
    before do
      stub_request(:get, "#{Varejonline::API_ADDRESS}/entidades/5").to_return(status: 200)
    end
    
    it 'issues a get to the entity url' do
      expect(described_class).to receive(:get).with('/5', body: { token: 'abc' }.to_json, headers: header).and_call_original
      
      Varejonline.new('abc').entities.find(5)
    end
  end
end
