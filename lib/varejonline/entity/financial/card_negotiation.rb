require 'varejonline/entity/base'

module Varejonline
  module Entity
    module Financial
      class CardNegotiation < Base
        attr_accessor :id, :ativo, :dataAlteracao, :descricao, :operadora, :bandeira, :tipoCartao
      end
    end
  end
end
