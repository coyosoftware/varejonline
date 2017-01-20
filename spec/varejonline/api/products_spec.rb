require 'spec_helper'

RSpec.describe Varejonline::API::Products do
  let(:header)        { {'Content-Type' => 'application/json', 'Accept' => 'application/json'} }
  let(:product_param) { { } }
  
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
