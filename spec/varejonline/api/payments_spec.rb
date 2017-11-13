require 'spec_helper'

RSpec.describe Varejonline::API::Payments do
  let(:header) { {'Content-Type' => 'application/json', 'Accept' => 'application/json'} }
  
  describe '.create' do
    before do
      stub_request(:post, "#{Varejonline::API_ADDRESS}/baixas/").to_return(status: 201)
    end
    
    let(:payment_param) { {
      'idContaBaixar' => 2, 'codigoContaDisponibilidade' => '123 - CLIENTE', 'data' => '10-01-2019'
    } }
    
    it 'issues a post to the payments url' do
      expect(described_class).to receive(:post).with('/', body: payment_param.merge!({ token: 'abc' }).to_json, headers: header).and_call_original
      
      Varejonline.new('abc').payments.create(payment_param)
    end
  end
end
