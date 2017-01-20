require 'varejonline/searcher/base'

module Varejonline
  module Searcher
    module Financial
      class DefaultEntrySearcher < Base
        attr_accessor :entidades, :tipo
      end
    end
  end
end