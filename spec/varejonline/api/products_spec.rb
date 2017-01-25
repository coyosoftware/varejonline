require 'spec_helper'

RSpec.describe Varejonline::API::Products do
  let(:header)        { {'Content-Type' => 'application/json', 'Accept' => 'application/json'} }
  let(:product_param) { { } }

  describe '.list' do
    before do
      stub_request(:get, "#{Varejonline::API_ADDRESS}/produtos/").to_return(status: 200)
    end
    
    it 'issues a get to the products url' do
      expect(described_class).to receive(:get).with('/', body: { token: 'abc' }.to_json, headers: header).and_call_original
      
      Varejonline.new('abc').products.list()
    end
    
    it 'issues a get to the products url using the searcher' do
      searcher = Varejonline::Searcher::Commercial::ProductSearcher.new({ quantidade: 10, inicio: 0 })
      
      expect(described_class).to receive(:get).with('/', body: searcher.as_parameter.merge!({ token: 'abc' }).to_json, headers: header).and_call_original
      
      Varejonline.new('abc').products.list(searcher)
    end
    
    it 'raises ArgumentError if the parameter is not a ProductSearcher' do
      expect{Varejonline.new('abc').products.list(Array.new)}.to raise_error(ArgumentError)
    end
  end
  
  describe '.find' do
    before do
      stub_request(:get, "#{Varejonline::API_ADDRESS}/produtos/5").to_return(status: 200)
    end
    
    it 'issues a get to the third party url' do
      expect(described_class).to receive(:get).with('/5', body: { token: 'abc' }.to_json, headers: header).and_call_original
      
      Varejonline.new('abc').products.find(5)
    end
  end
  
  describe '.save' do
    before do
      stub_request(:post, "#{Varejonline::API_ADDRESS}/produtos/").to_return(status: 201)
    end
    
    it 'issues a post to the products url' do
      expect(described_class).to receive(:post).with('/', body: product_param.merge!({ token: 'abc' }).to_json, headers: header).and_call_original
      
      Varejonline.new('abc').products.save(Varejonline::Entity::Commercial::Product.new)
    end
  end
  
  describe '.update' do
    before do
      stub_request(:put, "#{Varejonline::API_ADDRESS}/produtos/1").to_return(status: 200)
    end
    
    it 'issues a put to the installments url' do
      expect(described_class).to receive(:put).with('/1', body: product_param.merge!({ token: 'abc' }).to_json, headers: header).and_call_original
      
      Varejonline.new('abc').products.update(1, Varejonline::Entity::Commercial::Product.new)
    end
  end
end
