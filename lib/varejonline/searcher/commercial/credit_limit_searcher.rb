require 'varejonline/searcher/base'

module Varejonline
  module Searcher
    module Commercial
      class CreditLimitSearcher < Base
      	attr_accessor :classes, :"idTerceiro", :endereco, :uf, :cidade, :email, :"idClassificacaoCliente"
      end
    end
  end
end
