require 'varejonline/searcher/base'

module Varejonline
  module Searcher
    module Commercial
      class ProductSearcher < Base
        attr_accessor :entidades, :categoria, :alteradoApos, :produtoBase, :descricao, :codigoBarras, :codigoInterno, :codigoSistema
      end
    end
  end
end
