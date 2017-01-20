require 'spec_helper'

RSpec.describe Varejonline::Entity::Commercial::Product do
  describe '.as_parameter' do    
    let(:product_as_parameter) {{'descricao'=>'descricao', 'classificacao'=>'classificacao', 'origem'=>'origem', 'fci'=>'fci', 'metodoControle'=>'ESTOCAVEL', 
      'unidade'=>'UN', 'custoReferencial'=>BigDecimal.new('10.35'), 'codigoNcm'=>'12', 'cnpjFornecedores'=>'cnpjFornecedores', 'especificacao'=>'especificacao', 
      'codigoBarras'=>'codigoBarras', 'codigoInterno'=>'codigoInterno', 'codigoSistema'=>'codigoSistema', 'estoqueMaximo'=>BigDecimal.new('10.0'), 'estoqueMinimo'=>BigDecimal.new('2.0'), 
      'ativo'=>true, 'descontoMaximo'=>BigDecimal.new('1.0'), 'comissao'=>BigDecimal.new('2.0'), 'preco'=>BigDecimal.new('14.0') }}
      
    it 'returns the product as parameter' do
      product = Varejonline::Entity::Commercial::Product.new({'descricao'=>'descricao', 'classificacao'=>'classificacao', 'origem'=>'origem', 'fci'=>'fci', 'metodoControle'=>'ESTOCAVEL', 
      'unidade'=>'UN', 'custoReferencial'=>BigDecimal.new('10.35'), 'codigoNcm'=>'12', 'cnpjFornecedores'=>'cnpjFornecedores', 'especificacao'=>'especificacao', 
      'codigoBarras'=>'codigoBarras', 'codigoInterno'=>'codigoInterno', 'codigoSistema'=>'codigoSistema', 'estoqueMaximo'=>BigDecimal.new('10.0'), 'estoqueMinimo'=>BigDecimal.new('2.0'), 
      'ativo'=>true, 'descontoMaximo'=>BigDecimal.new('1.0'), 'comissao'=>BigDecimal.new('2.0'), 'preco'=>BigDecimal.new('14.0') })
      
      expect(product.as_parameter).to eq(product_as_parameter)
    end
  end
end
