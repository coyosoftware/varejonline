require 'varejonline/searcher/base'

module Varejonline
  module Searcher
    module Financial
      class ReceiptSearcher < Base
        attr_accessor :desde, :ate, :filtroData, :alteradoApos
      end
    end
  end
end