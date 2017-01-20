require 'varejonline/entity/base'

module Varejonline
  module Entity
    module Commercial
      class Product < Base
        attr_accessor :descricao, :classificacao, :origem, :fci, :metodoControle, :unidade, :custoReferencial, :codigoNcm
        attr_accessor :cnpjFornecedores, :especificacao, :codigoBarras, :codigoInterno, :codigoSistema, :estoqueMaximo
        attr_accessor :estoqueMinimo, :ativo, :descontoMaximo, :comissao, :preco, :categorias
      end
    end
  end
end
