require 'varejonline/searcher/base'

module Varejonline
  module Searcher
    module Operational
      class ProductBalanceSearcher < Base
        attr_accessor :produtos, :entidades, :inicio, :"alteradoApos", :quantidade, :data
      end
    end
  end
end