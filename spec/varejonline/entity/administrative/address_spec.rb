require 'spec_helper'

RSpec.describe Varejonline::Entity::Administrative::Address do
  describe '.as_parameter' do
    let(:address_as_parameter) { {'tipo' => 'AVENIDA', 'logradouro' => '9 de Julho', 'numero' => '900', 
      'bairro' => 'CENTRO', 'complemento' => 'APTO 1', 'cep' => '12244111', 'codigoIBGECidade' => '3554102',
      'tipoEndereco' => 'ENDERECO_COBRANCA'} }
      
    it 'returns the address as parameter' do
      address = Varejonline::Entity::Administrative::Address.new
      
      address.tipo = 'AVENIDA'
      address.logradouro = '9 de Julho'
      address.numero = '900'
      address.bairro = 'CENTRO'
      address.complemento = 'APTO 1'
      address.cep = '12244111'
      address.codigoIBGECidade = '3554102'
      address.tipoEndereco = 'ENDERECO_COBRANCA'
      
      expect(address.as_parameter).to eq(address_as_parameter)
    end
  end
end
