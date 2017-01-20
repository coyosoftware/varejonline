require 'spec_helper'

RSpec.describe Varejonline::API::ThirdParties do
  let(:header) { {'Content-Type' => 'application/json', 'Accept' => 'application/json'} }
  
  describe '.list' do
    before do
      stub_request(:get, "#{Varejonline::API_ADDRESS}/terceiros/").to_return(status: 200)
    end
    
    it 'issues a get to the third_parties url' do
      expect(described_class).to receive(:get).with('/', body: { token: 'abc' }.to_json, headers: header).and_call_original
      
      Varejonline.new('abc').third_parties.list()
    end
    
    it 'issues a get to the third_parties url using the searcher' do
      searcher = Varejonline::Searcher::Administrative::ThirdPartySearcher.new({ quantidade: 10, inicio: 0 })
      
      expect(described_class).to receive(:get).with('/', body: searcher.as_parameter.merge!({ token: 'abc' }).to_json, headers: header).and_call_original
      
      Varejonline.new('abc').third_parties.list(searcher)
    end
    
    it 'raises ArgumentError if the parameter is not a ThirdPartySearcher' do
      expect{Varejonline.new('abc').third_parties.list(Array.new)}.to raise_error(ArgumentError)
    end
  end
  
  describe '.find' do
    before do
      stub_request(:get, "#{Varejonline::API_ADDRESS}/terceiros/5").to_return(status: 200)
    end
    
    it 'issues a get to the third party url' do
      expect(described_class).to receive(:get).with('/5', body: { token: 'abc' }.to_json, headers: header).and_call_original
      
      Varejonline.new('abc').third_parties.find(5)
    end
  end
  
  describe '.create' do
    let(:third_party_params) { {'nome' => 'Nome do terceiro', 'documento' => '023.168.132-00', 'token' => 'abc'} }
    
    before do
      @third_party = Varejonline::Entity::Administrative::ThirdParty.new({'id' => '5', 'nome' => 'Nome do terceiro', 'documento' => '023.168.132-00',
        'rg' => '42.943.412-1', 'dataNascimento' => '12-08-1980'})
      
      @third_party.emails = ['email@email.com', 'other@email.com']
      
      @third_party.enderecos << Varejonline::Entity::Administrative::Address.new({'tipo' => 'AVENIDA', 'logradouro' => '9 de Julho', 'numero' => '900', 'bairro' => 'CENTRO',
        'complemento' => 'APTO 1', 'cep' => '12000111', 'codigoIBGECidade' => '3554102', 'tipoEndereco' => 'ENDERECO_COBRANCA'})
      @third_party.enderecos << Varejonline::Entity::Administrative::Address.new({'tipo' => 'RUA', 'logradouro' => '15 de Novembro', 'numero' => '1020', 'bairro' => 'JD. MARIA',
        'complemento' => 'APTO 1', 'cep' => '12600123', 'codigoIBGECidade' => '3554102', 'tipoEndereco' => 'ENDERECO_SEDE'})
        
      @third_party.telefones << Varejonline::Entity::Administrative::Phone.new({'ddi' => '55', 'ddd' => '12', 'numero' => '12341234'})
      @third_party.telefones << Varejonline::Entity::Administrative::Phone.new({'ddi' => '0', 'ddd' => '31', 'numero' => '12340000', 'ramal' => '1234'})
      
      @third_party.classes = ['SOCIO_PROPRIETARIO', 'FUNCIONARIO']
      
      stub_request(:post, "#{Varejonline::API_ADDRESS}/terceiros/").to_return(status: 201)
    end
    
    describe 'with raw parameters' do
      it 'posts to the third party url' do
        expect(described_class).to receive(:post).with('/', body: third_party_params.to_json, headers: header).and_call_original
        
        Varejonline.new('abc').third_parties.create({ 'nome' => 'Nome do terceiro', 'documento' => '023.168.132-00' })
      end
    end
    
    describe 'with entity parameter' do
      it 'posts to the third party url' do
        expect(described_class).to receive(:post).with('/', body: @third_party.as_parameter.merge!( token: 'abc' ).to_json, headers: header).and_call_original
        
        Varejonline.new('abc').third_parties.create(@third_party)
      end
    end
    
    describe 'with invalid parameter' do
      it 'raises ArgumentError when passing neither a Hash nor a ThirdParty' do
        expect{Varejonline.new('abc').third_parties.create(Array.new)}.to raise_error(ArgumentError)
      end
    end
  end
  
  describe '.update' do
    let(:third_party_params) { {'nome' => "Nome do terceiro", 'documento' => "023.168.132-00", 'token' => "abc"} }
    
    before do
      @third_party = Varejonline::Entity::Administrative::ThirdParty.new({'id' => '5', 'nome' => 'Nome do terceiro', 'documento' => '023.168.132-00',
        'rg' => '42.943.412-1', 'dataNascimento' => '12-08-1980'})
      
      @third_party.emails = ['email@email.com', 'other@email.com']
      
      @third_party.enderecos << Varejonline::Entity::Administrative::Address.new({'tipo' => 'AVENIDA', 'logradouro' => '9 de Julho', 'numero' => '900', 'bairro' => 'CENTRO',
        'complemento' => 'APTO 1', 'cep' => '12000111', 'codigoIBGECidade' => '3554102', 'tipoEndereco' => 'ENDERECO_COBRANCA'})
      @third_party.enderecos << Varejonline::Entity::Administrative::Address.new({'tipo' => 'RUA', 'logradouro' => '15 de Novembro', 'numero' => '1020', 'bairro' => 'JD. MARIA',
        'complemento' => 'APTO 1', 'cep' => '12600123', 'codigoIBGECidade' => '3554102', 'tipoEndereco' => 'ENDERECO_SEDE'})
        
      @third_party.telefones << Varejonline::Entity::Administrative::Phone.new({'ddi' => '55', 'ddd' => '12', 'numero' => '12341234'})
      @third_party.telefones << Varejonline::Entity::Administrative::Phone.new({'ddi' => '0', 'ddd' => '31', 'numero' => '12340000', 'ramal' => '1234'})
      
      @third_party.classes = ['SOCIO_PROPRIETARIO', 'FUNCIONARIO']
      
      stub_request(:put, "#{Varejonline::API_ADDRESS}/terceiros/5").to_return(status: 200)
    end
    
    describe 'with raw parameters' do
      it 'puts to the third party url' do
        expect(described_class).to receive(:put).with('/5', body: third_party_params.to_json, headers: header).and_call_original
        
        Varejonline.new('abc').third_parties.update(5, { 'nome' => 'Nome do terceiro', 'documento' => '023.168.132-00'})
      end
    end
    
    describe 'with entity parameter' do
      it 'puts to the third party url' do
        expect(described_class).to receive(:put).with('/5', body: @third_party.as_parameter.merge!( token: 'abc' ).to_json, headers: header).and_call_original

        Varejonline.new('abc').third_parties.update(5, @third_party)
      end
    end
    
    describe 'with invalid parameter' do
      it 'raises ArgumentError when passing neither a Hash nor a ThirdParty' do
        expect{Varejonline.new('abc').third_parties.update(Array.new)}.to raise_error(ArgumentError)
      end
    end
  end

  describe '.credit_limit_information' do
    before do
      stub_request(:get, "#{Varejonline::API_ADDRESS}/terceiros/5/limites_credito").to_return(status: 200)
    end

    it 'issues a get to the third party credit limit url' do
      expect(described_class).to receive(:get).with('/5/limites_credito', body: { token: 'abc' }.to_json, headers: header).and_call_original
      
      Varejonline.new('abc').third_parties.credit_limit_information(5)
    end
  end

  describe '.update_credit_limit' do
    let(:credit_limit_params) { {'total' => BigDecimal.new('154.32'), 'token' => 'abc'} }

    before do
      @credit_limit = Varejonline::Entity::Commercial::CreditLimit.new({'total' => BigDecimal.new('154.32')})
      
      stub_request(:put, "#{Varejonline::API_ADDRESS}/terceiros/5/limites_credito/5").to_return(status: 200)
    end
    
    describe 'with raw parameters' do
      it 'puts to the third party credit limit url' do
        expect(described_class).to receive(:put).with('/5/limites_credito/5', body: credit_limit_params.to_json, headers: header).and_call_original
        
        Varejonline.new('abc').third_parties.update_credit_limit(5, {'total' => BigDecimal.new('154.32')})
      end
    end
    
    describe 'with entity parameter' do
      it 'puts to the third party credit limit url' do
        expect(described_class).to receive(:put).with('/5/limites_credito/5', body: @credit_limit.as_parameter.merge!( token: 'abc' ).to_json, headers: header).and_call_original
        
        Varejonline.new('abc').third_parties.update_credit_limit(5, @credit_limit)
      end
    end
    
    describe 'with invalid parameter' do
      it 'raises ArgumentError when passing neither a Hash nor a CreditLimit' do
        expect{Varejonline.new('abc').third_parties.update_credit_limit(5, Array.new)}.to raise_error(ArgumentError)
      end
    end
  end

  describe '.block_credit_limit' do
    let(:credit_limit_block_params) { {'motivo' => 'Cliente caloteiro', 'token' => 'abc'} }

    before do
      stub_request(:put, "#{Varejonline::API_ADDRESS}/terceiros/5/limites_credito/bloquear").to_return(status: 200)
    end

    it 'puts to the third party credit block url' do
      expect(described_class).to receive(:put).with('/5/limites_credito/bloquear', body: credit_limit_block_params.to_json, headers: header).and_call_original
      
      Varejonline.new('abc').third_parties.block_credit_limit(5, 'Cliente caloteiro')
    end
  end

  describe '.unlock_credit_limit' do
    let(:credit_limit_unlock_params) { {'motivo' => 'Cliente pagou', 'token' => 'abc'} }

    before do
      stub_request(:put, "#{Varejonline::API_ADDRESS}/terceiros/5/limites_credito/desbloquear").to_return(status: 200)
    end

    it 'puts to the third party credit unlock url' do
      expect(described_class).to receive(:put).with('/5/limites_credito/desbloquear', body: credit_limit_unlock_params.to_json, headers: header).and_call_original
      
      Varejonline.new('abc').third_parties.unlock_credit_limit(5, 'Cliente pagou')
    end
  end
end