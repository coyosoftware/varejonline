require 'varejonline/entity/base'

module Varejonline
  module Entity
    module Operational
      class ProductBalance < Base
        attr_accessor :idEntidade, :produto, :quantidade, :dataAlteracao, :data
      end
    end
  end
end
