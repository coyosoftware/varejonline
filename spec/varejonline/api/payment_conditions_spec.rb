require 'spec_helper'

RSpec.describe Varejonline::API::PaymentConditions do
  let(:header) { {'Content-Type' => 'application/json', 'Accept' => 'application/json'} }

  describe '.list' do
    before do
      stub_request(:get, "#{Varejonline::API_ADDRESS}/planos-pagamento/").to_return(status: 200)
    end
    
    it 'issues a get to the product categories url' do
      expect(described_class).to receive(:get).with('/', body: { token: 'abc' }.to_json, headers: header).and_call_original
      
      Varejonline.new('abc').payment_conditions.list
    end
  end
end
