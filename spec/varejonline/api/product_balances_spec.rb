require 'spec_helper'

RSpec.describe Varejonline::API::ProductBalances do
  let(:header) { {'Content-Type' => 'application/json', 'Accept' => 'application/json'} }
  
  describe '.list' do
    before do
      stub_request(:get, "#{Varejonline::API_ADDRESS}/saldos-mercadorias/").to_return(status: 200)
    end
    
    it 'issues a get to the product balances url' do
      expect(described_class).to receive(:get).with('/', body: { token: 'abc' }.to_json, headers: header).and_call_original
      
      Varejonline.new('abc').product_balances.list()
    end
    
    it 'issues a get to the product balances url using the searcher' do
      searcher = Varejonline::Searcher::Operational::ProductBalanceSearcher.new({ quantidade: 10, inicio: 0 })
      
      expect(described_class).to receive(:get).with('/', body: searcher.as_parameter.merge!({ token: 'abc' }).to_json, headers: header).and_call_original
      
      Varejonline.new('abc').product_balances.list(searcher)
    end
    
    it 'raise ArgumentError if the parameter is not a ProductBalanceSearcher' do
      expect{ Varejonline.new('abc').product_balances.list(Array.new) }.to raise_error(ArgumentError)
    end
  end
end