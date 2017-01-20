require 'spec_helper'

RSpec.describe Varejonline::API::CreditLimits do
  let(:header) { {'Content-Type' => 'application/json', 'Accept' => 'application/json'} }
  
  describe '.list' do
    before do
      stub_request(:get, "#{Varejonline::API_ADDRESS}/limites_credito/").to_return(status: 200)
    end
    
    it 'issues a get to the credit_limits url' do
      expect(described_class).to receive(:get).with('/', body: { token: 'abc' }.to_json, headers: header).and_call_original
      
      Varejonline.new('abc').credit_limits.list()
    end
    
    it 'issues a get to the credit_limits url using the searcher' do
      searcher = Varejonline::Searcher::Commercial::CreditLimitSearcher.new({ quantidade: 10, inicio: 0 })
      
      expect(described_class).to receive(:get).with('/', body: searcher.as_parameter.merge!({ token: 'abc' }).to_json, headers: header).and_call_original
      
      Varejonline.new('abc').credit_limits.list(searcher)
    end
    
    it 'raises ArgumentError if the parameter is not a CreditLimitSearcher' do
      expect{Varejonline.new('abc').credit_limits.list(Array.new)}.to raise_error(ArgumentError)
    end
  end
  
  context '.block_history' do
    let(:history_params) { {'desde' => Date.parse('01/01/2015'), 'ate' => Date.parse('11/01/2015'), idTerceiro: 5,  token: 'abc' } }

    before do
      stub_request(:get, "#{Varejonline::API_ADDRESS}/limites_credito/historico_bloqueio").to_return(status: 200)
    end

    it 'issues a get to the third party credit history url' do
      expect(described_class).to receive(:get).with('/historico_bloqueio', body: history_params.to_json, headers: header).and_call_original
      
      Varejonline.new('abc').credit_limits.block_history(5, Date.parse('01/01/2015'), Date.parse('11/01/2015'))
    end
  end
end
