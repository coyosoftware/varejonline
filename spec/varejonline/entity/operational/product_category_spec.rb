require 'spec_helper'

RSpec.describe Varejonline::Entity::Operational::ProductCategory do
  describe '.as_parameter' do
    let(:product_category_as_parameter) {{'id'=>'1', 'ativo'=>'ativo', 'dataAlteracao'=>'01/01/2000', 'nome'=>'nome', 'origem'=>'1', 
      'unidade'=>'UN', 'metodoControle'=>'ESTOCAVEL', 'classificacao'=>'1', 'categoriaPai'=>'2', 'nivel'=>'1'}}

    it 'returns the product as parameter' do
      product_category = Varejonline::Entity::Operational::ProductCategory.new({'id'=>'1', 'ativo'=>'ativo', 'dataAlteracao'=>'01/01/2000', 'nome'=>'nome', 'origem'=>'1', 
        'unidade'=>'UN', 'metodoControle'=>'ESTOCAVEL', 'classificacao'=>'1', 'categoriaPai'=>'2', 'nivel'=>'1'})

      expect(product_category.as_parameter).to eq(product_category_as_parameter)
    end
  end
end
