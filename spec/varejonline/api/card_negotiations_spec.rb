require 'spec_helper'

RSpec.describe Varejonline::API::CardNegotiations do
  let(:header)        { {'Content-Type' => 'application/json', 'Accept' => 'application/json'} }
  let(:card_negotiation_param) { {} }
  
  describe '.list' do
    before do
      stub_request(:get, "#{Varejonline::API_ADDRESS}/negociacoes-cartao/").to_return(status: 200)
    end
    
    it 'issues a get to the card negotiations url' do
      expect(described_class).to receive(:get).with('/', body: { token: 'abc' }.to_json, headers: header).and_call_original
      
      Varejonline.new('abc').card_negotiations.list
    end
  end
end