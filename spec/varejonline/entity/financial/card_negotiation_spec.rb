require 'spec_helper'

RSpec.describe Varejonline::Entity::Financial::CardNegotiation do
  describe '.as_parameter' do
    let(:card_negotiation_as_parameter) {{'id'=>'7', 'ativo'=>'true', 'dataAlteracao'=>'12-05-2010 12:05:56', 'descricao'=>'VISA DEBITO', 'operadora'=>'CIELO', 
      'bandeira'=>'VISA', 'tipoCartao'=> 'DEBITO'}}

    it 'returns the product as parameter' do
      card_negotiation = Varejonline::Entity::Financial::CardNegotiation.new({'id'=>'7', 'ativo'=>'true', 'dataAlteracao'=>'12-05-2010 12:05:56', 'descricao'=>'VISA DEBITO', 'operadora'=>'CIELO', 
      'bandeira'=>'VISA', 'tipoCartao'=> 'DEBITO'})

      expect(card_negotiation.as_parameter).to eq(card_negotiation_as_parameter)
    end
  end
end