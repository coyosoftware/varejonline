require 'spec_helper'

RSpec.describe Varejonline::API::CategoryLevels do
  let(:header)        { {'Content-Type' => 'application/json', 'Accept' => 'application/json'} }
  let(:product_param) { {} }
  
  describe '.list' do
    before do
      stub_request(:get, "#{Varejonline::API_ADDRESS}/niveis-categoria-produto/").to_return(status: 200)
    end
    
    it 'issues a get to the category levels url' do
      expect(described_class).to receive(:get).with('/', body: { token: 'abc' }.to_json, headers: header).and_call_original
      
      Varejonline.new('abc').category_levels.list
    end
  end
end