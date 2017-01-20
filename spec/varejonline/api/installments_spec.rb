require 'spec_helper'

RSpec.describe Varejonline::API::Installments do
  let(:header) { {'Content-Type' => 'application/json', 'Accept' => 'application/json'} }
  
  describe '.information' do
    before do
      stub_request(:get, "#{Varejonline::API_ADDRESS}/configuracao-credito/").to_return(status: 200)
    end
    
    it 'issues a get to the installments url' do
      expect(described_class).to receive(:get).with('/', body: { token: 'abc' }.to_json, headers: header).and_call_original
      
      Varejonline.new('abc').installments.information
    end
  end
  
  describe '.configure' do
    before do
      stub_request(:put, "#{Varejonline::API_ADDRESS}/configuracao-credito/1").to_return(status: 201)
    end
    
    let(:installment_param) { {} }
    
    it 'issues a post to the installments url' do
      expect(described_class).to receive(:put).with('/1', body: installment_param.merge!({ token: 'abc' }).to_json, headers: header).and_call_original
      
      Varejonline.new('abc').installments.configure(1, installment_param)
    end
  end
end
