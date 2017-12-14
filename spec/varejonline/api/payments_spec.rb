require 'spec_helper'

RSpec.describe Varejonline::API::Payments do
  let(:header) { {'Content-Type' => 'application/json', 'Accept' => 'application/json'} }

  describe '.list' do
    before do
      stub_request(:get, "#{Varejonline::API_ADDRESS}/baixas/").to_return(status: 200)
    end
    
    it 'issues a get to the payments url' do
      expect(described_class).to receive(:get).with('/', body: { token: 'abc' }.to_json, headers: header).and_call_original
      
      Varejonline.new('abc').payments.list()
    end
    
    it 'issues a get to the payments url using the searcher' do
      searcher = Varejonline::Searcher::Financial::PaymentSearcher.new({ quantidade: 10, inicio: 0, 
        desde: '01-01-2015', ate: '10-01-2015', filtroData: 'dataVencimento', alteradoApos: '01-01-2015 10:10:10' })

      expect(described_class).to receive(:get).with('/', body: searcher.as_parameter.merge!({ token: 'abc' }).to_json, headers: header).and_call_original

      Varejonline.new('abc').payments.list(searcher)
    end
   
    it 'raises ArgumentError if the parameter is not a paymentsearcher' do
      expect{Varejonline.new('abc').payments.list(Array.new)}.to raise_error(ArgumentError)
    end
  end
  
  describe '.find' do
    before do
      stub_request(:get, "#{Varejonline::API_ADDRESS}/baixas/1").to_return(status: 200)
    end
    
    it 'returns an especific receipt' do
      expect(described_class).to receive(:get).with('/1', body: { token: 'abc' }.to_json, headers: header).and_call_original

      Varejonline.new('abc').payments.find(1)
    end    
  end
  
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
