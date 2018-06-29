require 'varejonline/entity/base'

module Varejonline
  module Entity
    module Operational
      class Unit < Base
         attr_accessor :id, :ativo, :dataAlteracao, :nome, :sigla
      end
    end
  end
end
