require 'spec_helper'

RSpec.describe Varejonline::API::ProductCategories do
  let(:header) { {'Content-Type' => 'application/json', 'Accept' => 'application/json'} }
  let(:product_param) {{}}
  
  describe '.list' do
    before do
      stub_request(:get, "#{Varejonline::API_ADDRESS}/categorias-produto/").to_return(status: 200)
    end
    
    it 'issues a get to the product categories url' do
      expect(described_class).to receive(:get).with('/', body: { token: 'abc' }.to_json, headers: header).and_call_original
      
      Varejonline.new('abc').product_categories.list
    end
  end
end
