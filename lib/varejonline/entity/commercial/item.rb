require 'varejonline/entity/base'

module Varejonline
  module Entity
    module Commercial
      class Item < Base
        attr_accessor :idProduto, :quantidade, :valorDesconto, :valorUnitario
      end
    end
  end
end
