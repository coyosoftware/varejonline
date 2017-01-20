require 'spec_helper'

RSpec.describe Varejonline::Entity::Administrative::ThirdParty do
  describe '.as_parameter' do
    let(:third_party_as_parameter) { {'id' => '5', 'nome' => 'Nome do terceiro', 'documento' => '023.168.132-00', 'emails' => ['email@email.com', 'other@email.com'],
      'rg' => '42.943.412-1', 'dataNascimento' => '12-08-1980', 'enderecos' => [{'tipo' => 'AVENIDA', 'logradouro' => '9 de Julho', 'numero' => '900', 'bairro' => 'CENTRO',
      'complemento' => 'APTO 1', 'cep' => '12000111', 'codigoIBGECidade' => '3554102', 'tipoEndereco' => 'ENDERECO_COBRANCA'}, {'tipo' => 'RUA', 
      'logradouro' => '15 de Novembro', 'numero' => '1020', 'bairro' => 'JD. MARIA', 'complemento' => 'APTO 1', 'cep' => '12600123', 'codigoIBGECidade' => '3554102', 
      'tipoEndereco' => 'ENDERECO_SEDE'}], 'telefones' => [{'ddi' => '55', 'ddd' => '12', 'numero' => '12341234'}, {'ddi' => '0', 'ddd' => '31', 'numero' => '12340000', 
      'ramal' => '1234'}], 'classes' => ['SOCIO_PROPRIETARIO', 'FUNCIONARIO']} }
      
    it 'returns the third party as parameter' do
      third_party = Varejonline::Entity::Administrative::ThirdParty.new({'id' => '5', 'nome' => 'Nome do terceiro', 'documento' => '023.168.132-00',
        'rg' => '42.943.412-1', 'dataNascimento' => '12-08-1980'})
      
      third_party.emails = ['email@email.com', 'other@email.com']
      
      third_party.enderecos << Varejonline::Entity::Administrative::Address.new({'tipo' => 'AVENIDA', 'logradouro' => '9 de Julho', 'numero' => '900', 'bairro' => 'CENTRO',
        'complemento' => 'APTO 1', 'cep' => '12000111', 'codigoIBGECidade' => '3554102', 'tipoEndereco' => 'ENDERECO_COBRANCA'})
      third_party.enderecos << Varejonline::Entity::Administrative::Address.new({'tipo' => 'RUA', 'logradouro' => '15 de Novembro', 'numero' => '1020', 'bairro' => 'JD. MARIA',
        'complemento' => 'APTO 1', 'cep' => '12600123', 'codigoIBGECidade' => '3554102', 'tipoEndereco' => 'ENDERECO_SEDE'})
        
      third_party.telefones << Varejonline::Entity::Administrative::Phone.new({'ddi' => '55', 'ddd' => '12', 'numero' => '12341234'})
      third_party.telefones << Varejonline::Entity::Administrative::Phone.new({'ddi' => '0', 'ddd' => '31', 'numero' => '12340000', 'ramal' => '1234'})
      
      third_party.classes = ['SOCIO_PROPRIETARIO', 'FUNCIONARIO']
      
      expect(third_party.as_parameter).to eq(third_party_as_parameter)
    end
  end
end
