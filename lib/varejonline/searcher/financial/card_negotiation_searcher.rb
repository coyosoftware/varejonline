require 'varejonline/searcher/base'

module Varejonline
  module Searcher
    module Financial
      class CardNegotiationSearcher < Base
        attr_accessor :inicio, :quantidade, :tipoCartao, :bandeiraCartao, :alteradoApos
      end
    end
  end
end