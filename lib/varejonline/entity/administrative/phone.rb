require 'varejonline/entity/base'

module Varejonline
  module Entity
    module Administrative
      class Phone < Base
        attr_accessor :ddi, :ddd, :numero, :ramal
      end
    end
  end
end