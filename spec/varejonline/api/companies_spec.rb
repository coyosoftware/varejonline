require 'spec_helper'

RSpec.describe Varejonline::API::Companies do
  let(:header) { {'Content-Type' => 'application/json', 'Accept' => 'application/json'} }
  
  describe '.list' do
    before do
      stub_request(:get, "#{Varejonline::API_ADDRESS}/empresas/").to_return(status: 200)
    end
    
    it 'issues a get to the companies url' do
      expect(described_class).to receive(:get).with('/', body: { token: 'abc' }.to_json, headers: header).and_call_original
      
      Varejonline.new('abc').companies.list()
    end
    
    it 'issues a get to the companies url using the searcher' do
      searcher = Varejonline::Searcher::Administrative::CompanySearcher.new({ quantidade: 10, inicio: 0 })
      
      expect(described_class).to receive(:get).with('/', body: searcher.as_parameter.merge!({ token: 'abc' }).to_json, headers: header).and_call_original
      
      Varejonline.new('abc').companies.list(searcher)
    end
    
    it 'raise ArgumentError if the parameter is not a CompanySearcher' do
      expect{Varejonline.new('abc').companies.list(Array.new)}.to raise_error(ArgumentError)
    end
  end
  
  describe '.find' do
    before do
      stub_request(:get, "#{Varejonline::API_ADDRESS}/empresas/5").to_return(status: 200)
    end
    
    it 'issues a get to the company url' do
      expect(described_class).to receive(:get).with('/5', body: { token: 'abc' }.to_json, headers: header).and_call_original
      
      Varejonline.new('abc').companies.find(5)
    end
  end
end
