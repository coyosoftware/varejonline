require 'spec_helper'

RSpec.describe Varejonline::API::Orders do
  let(:header)      { {'Content-Type' => 'application/json', 'Accept' => 'application/json'} }
  let(:order_param) { { } }
  
  describe '.list' do
    before do
      stub_request(:get, "#{Varejonline::API_ADDRESS}/pedidos/").to_return(status: 200)
    end
    
    it 'issues a get to the orders url' do
      expect(described_class).to receive(:get).with('/', body: { token: 'abc' }.to_json, headers: header).and_call_original
      
      Varejonline.new('abc').orders.list()
    end
    
    it 'issues a get to the orders url using the searcher' do
      searcher = Varejonline::Searcher::Operational::OrderSearcher.new({ quantidade: 10, inicio: 0 })
      
      expect(described_class).to receive(:get).with('/', body: searcher.as_parameter.merge!({ token: 'abc' }).to_json, headers: header).and_call_original
      
      Varejonline.new('abc').orders.list(searcher)
    end
    
    it 'raises ArgumentError if the parameter is not a OrderSearcher' do
      expect{Varejonline.new('abc').orders.list(Array.new)}.to raise_error(ArgumentError)
    end
  end
  
  describe '.find' do
    before do
      stub_request(:get, "#{Varejonline::API_ADDRESS}/pedidos/5").to_return(status: 200)
    end
    
    it 'issues a get to the order url' do
      expect(described_class).to receive(:get).with('/5', body: { token: 'abc' }.to_json, headers: header).and_call_original
      
      Varejonline.new('abc').orders.find(5)
    end
  end

  describe '.save' do
    before do
      stub_request(:post, "#{Varejonline::API_ADDRESS}/pedidos/").to_return(status: 201)
    end

    it 'issues a post to the orders url' do
      order = Varejonline::Entity::Commercial::Order.new

      expect(described_class).to receive(:post).with('/', body: order.as_parameter.merge!({ token: 'abc' }).to_json, headers: header).and_call_original

      Varejonline.new('abc').orders.save(order)
    end
  end
end