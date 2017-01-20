require 'spec_helper'

RSpec.describe Varejonline::API::UserData do
  let(:header) { {'Content-Type' => 'application/json', 'Accept' => 'application/json'} }
  
  describe '.get' do
    before do
      stub_request(:get, "#{Varejonline::API_ADDRESS}/dados-login/").to_return(status: 200)
    end
    
    it 'issues a get to the dados-login url' do
      expect(described_class).to receive(:get).with('/', body: { token: 'abc' }.to_json, headers: header).and_call_original
      
      Varejonline.new('abc').user_data.get
    end
  end
end
