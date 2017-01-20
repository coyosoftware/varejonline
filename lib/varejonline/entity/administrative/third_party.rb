require 'varejonline/entity/base'

module Varejonline
  module Entity
    module Administrative
      class ThirdParty < Base
        attr_accessor :id, :nome, :documento, :emails, :rg, :dataNascimento, :ie, :enderecos, :telefones, :classes

        def initialize(*h)
          self.emails = Array.new
          self.enderecos = Array.new
          self.telefones = Array.new
          self.classes = Array.new

          super
        end

        def as_parameter
          variables = instance_variables.map do |name|
            case name
              when :@enderecos, :@telefones
                [name.to_s.tr("@", ""), instance_variable_get(name).map(&:as_parameter)]
              else 
                [name.to_s.tr("@", ""), instance_variable_get(name)]
            end
          end

          Hash[variables.compact]
        end
      end
    end
  end
end