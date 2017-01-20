require 'varejonline/searcher/base'

module Varejonline
  module Searcher
    module Financial
      class PaymentConditionSearcher < Base
        attr_accessor :inicio, :quantidade, :alteradoApos, :documentoTerceiro
      end
    end
  end
end
