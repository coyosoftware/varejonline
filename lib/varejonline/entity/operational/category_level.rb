require 'varejonline/entity/base'

module Varejonline
  module Entity
    module Operational
      class CategoryLevel < Base
        attr_accessor :id, :ativo, :dataAlteracao, :nome, :nivel, :compoeReferenciaBase, :idNivelCategoriaProdutoPai
      end
    end
  end
end
