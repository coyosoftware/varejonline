require 'varejonline/init_from_hash'

module Varejonline
  module Searcher
    class Base
      include InitFromHash

      attr_accessor :inicio, :quantidade

      def as_parameter
        variables = instance_variables.map do |name|
          variable_name = name.to_s.tr("@", "")

          [variable_name, instance_variable_get(name)]
        end

        Hash[variables]
      end
    end
  end
end