require 'spec_helper'

RSpec.describe Varejonline::API::Receipts do
  let(:header) { {'Content-Type' => 'application/json', 'Accept' => 'application/json'} }
  
  describe '.list' do
    before do
      stub_request(:get, "#{Varejonline::API_ADDRESS}/contas-receber/").to_return(status: 200)
    end
    
    it 'issues a get to the receipts url' do
      expect(described_class).to receive(:get).with('/', body: { token: 'abc' }.to_json, headers: header).and_call_original
      
      Varejonline.new('abc').receipts.list()
    end
    
    it 'issues a get to the reciepts url using the searcher' do
      searcher = Varejonline::Searcher::Financial::ReceiptSearcher.new({ quantidade: 10, inicio: 0, 
        desde: '01-01-2015', ate: '10-01-2015', filtroData: 'dataVencimento', alteradoApos: '01-01-2015 10:10:10' })

      expect(described_class).to receive(:get).with('/', body: searcher.as_parameter.merge!({ token: 'abc' }).to_json, headers: header).and_call_original

      Varejonline.new('abc').receipts.list(searcher)
    end
   
    it 'raises ArgumentError if the parameter is not a ReceiptSearcher' do
      expect{Varejonline.new('abc').receipts.list(Array.new)}.to raise_error(ArgumentError)
    end
  end
  
  describe '.find' do
    before do
      stub_request(:get, "#{Varejonline::API_ADDRESS}/contas-receber/1").to_return(status: 200)
    end
    
    it 'returns an especific receipt' do
      expect(described_class).to receive(:get).with('/1', body: { token: 'abc' }.to_json, headers: header).and_call_original

      Varejonline.new('abc').receipts.find(1)
    end    
  end
end
