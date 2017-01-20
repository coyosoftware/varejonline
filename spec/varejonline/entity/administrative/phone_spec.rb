require 'spec_helper'

RSpec.describe Varejonline::Entity::Administrative::Phone do
  describe '.as_parameter' do
    let(:phone_as_parameter) { {'ddi' => '55', 'ddd' => '12', 'numero' => '12340000', 'ramal' => '1269'} }
      
    it 'returns the phone as parameter' do
      phone = Varejonline::Entity::Administrative::Phone.new
      
      phone.ddi = '55'
      phone.ddd = '12'
      phone.numero = '12340000'
      phone.ramal = '1269'
      
      expect(phone.as_parameter).to eq(phone_as_parameter)
    end
  end
end
