require 'varejonline/searcher/base'

module Varejonline
  module Searcher
    module Operational
      class OrderSearcher < Base
        attr_accessor :desde, :ate, :entidades, :"alteradoApos", :terceiro
      end
    end
  end
end