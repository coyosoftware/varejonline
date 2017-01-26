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
    let(:product_params) { {'descricao' => '05-01-2015', 'token' => 'abc'} }
    
    before do
      @product = Varejonline::Entity::Commercial::Product.new
      
      stub_request(:post, "#{Varejonline::API_ADDRESS}/produtos/").to_return(status: 201)
    end

    describe 'with raw parameters' do
      it 'posts to the products url' do
        expect(described_class).to receive(:post).with('/', body: product_params.to_json, headers: header).and_call_original
        
        Varejonline.new('abc').products.save({'descricao' => '05-01-2015'})
      end
    end
    
    describe 'with entity parameter' do
      it 'posts to the products url' do
        expect(described_class).to receive(:post).with('/', body: @product.as_parameter.merge!( token: 'abc' ).to_json, headers: header).and_call_original
        
        Varejonline.new('abc').products.save(@product)
      end
    end
    
    describe 'with invalid parameter' do
      it 'raises ArgumentError when passing neither a Hash nor a Product' do
        expect{Varejonline.new('abc').products.save(Array.new)}.to raise_error(ArgumentError)
      end
    end
  end
  
  describe '.update' do
    let(:product_params) { {'descricao' => '05-01-2015', 'token' => 'abc'} }

    before do
      @product = Varejonline::Entity::Commercial::Product.new

      stub_request(:put, "#{Varejonline::API_ADDRESS}/produtos/1").to_return(status: 200)
    end

    describe 'with raw parameters' do
      it 'puts to the products url' do
        expect(described_class).to receive(:put).with('/1', body: product_params.to_json, headers: header).and_call_original
        
        Varejonline.new('abc').products.update(1, {'descricao' => '05-01-2015'})
      end
    end
    
    describe 'with entity parameter' do
      it 'puts to the products url' do
        expect(described_class).to receive(:put).with('/1', body: @product.as_parameter.merge!( token: 'abc' ).to_json, headers: header).and_call_original
        
        Varejonline.new('abc').products.update(1, @product)
      end
    end
    
    describe 'with invalid parameter' do
      it 'raises ArgumentError when passing neither a Hash nor a Product' do
        expect{Varejonline.new('abc').products.update(1, Array.new)}.to raise_error(ArgumentError)
      end
    end
  end
end
