require 'spec_helper'

RSpec.describe Varejonline::API::Provisions do
  let(:header) { {'Content-Type' => 'application/json', 'Accept' => 'application/json'} }
  
  describe '.create' do
    before do
      stub_request(:post, "#{Varejonline::API_ADDRESS}/provisoes-contas/").to_return(status: 201)
    end
    
    let(:provision_param) { {
      'idLancamentoPadrao' => 3, 'idEntidade' => 1, 'idTerceiro' => 2, 'data' => '25-02-2019',
      'valor' => '123.50', 'historico' => 'histórico'
    } }
    
    it 'issues a post to the provisions url' do
      expect(described_class).to receive(:post).with('/', body: provision_param.merge!({ token: 'abc' }).to_json, headers: header).and_call_original
      
      Varejonline.new('abc').provisions.create(provision_param)
    end
  end
end
