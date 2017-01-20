require 'spec_helper'

RSpec.describe Varejonline::Entity::Commercial::Installment do
  describe '.as_parameter' do
    let(:installment_as_parameter) {{'bloquearClienteSemAnalise' => true, 'bloqueioAutomatico' => true, 
      'mensagemBloqueio' => 'Seu crédito está bloqueado! :(',
      'permissaoValorExcedente' => false, 'permiteLiberarBloqueioManual' => true, 'permiteVenderSemAnalise' => false, 'valorCredMaximoCliente' => true, 
      'creditoMaximoCliente' => BigDecimal.new('1000.35'), 'limiteMensal' => 'SOBRE_TOTAL_DE_CREDITO', 'limiteCreditoSobreRenda' => true,
      'limiteSobreRenda' => BigDecimal.new('10.35')}}
      
    it 'returns the installment as parameter' do
      installment = Varejonline::Entity::Commercial::Installment.new({'bloquearClienteSemAnalise' => true, 'bloqueioAutomatico' => true, 
        'mensagemBloqueio' => 'Seu crédito está bloqueado! :(',
      'permissaoValorExcedente' => false, 'permiteLiberarBloqueioManual' => true, 'permiteVenderSemAnalise' => false, 'valorCredMaximoCliente' => true, 
      'creditoMaximoCliente' => BigDecimal.new('1000.35'), 'limiteMensal' => 'SOBRE_TOTAL_DE_CREDITO', 'limiteCreditoSobreRenda' => true,
      'limiteSobreRenda' => BigDecimal.new('10.35')})
      
      expect(installment.as_parameter).to eq(installment_as_parameter)
    end
  end
end
