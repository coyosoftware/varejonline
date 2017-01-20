require 'spec_helper'

RSpec.describe Varejonline::API::DefaultEntries do
  let(:header) { {'Content-Type' => 'application/json', 'Accept' => 'application/json'} }
  
  describe '.list' do
    before do
      stub_request(:get, "#{Varejonline::API_ADDRESS}/lancamentos-padroes/").to_return(status: 200)
    end
    
    it 'issues a get to the default_entries url' do
      expect(described_class).to receive(:get).with('/', body: { token: 'abc' }.to_json, headers: header).and_call_original
      
      Varejonline.new('abc').default_entries.list()
    end
    
    it 'issues a get to the default_entries url using the searcher' do
      searcher = Varejonline::Searcher::Financial::DefaultEntrySearcher.new({ quantidade: 10, inicio: 0})
      
      expect(described_class).to receive(:get).with('/', body: searcher.as_parameter.merge!({ token: 'abc' }).to_json, headers: header).and_call_original
      
      Varejonline.new('abc').default_entries.list(searcher)
    end
    
    it 'raises ArgumentError if the parameter is not a DefaultEntrySearcher' do
      expect{ Varejonline.new('abc').default_entries.list(Array.new) }.to raise_error(ArgumentError)
    end
  end
  
  describe '.find' do
    before do
      stub_request(:get, "#{Varejonline::API_ADDRESS}/lancamentos-padroes/5").to_return(status: 200)
    end
    
    it 'issues a get to the default entry url' do
      expect(described_class).to receive(:get).with('/5', body: { token: 'abc' }.to_json, headers: header).and_call_original
      
      Varejonline.new('abc').default_entries.find(5)
    end
  end
end
