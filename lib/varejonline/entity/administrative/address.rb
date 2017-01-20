require 'varejonline/entity/base'

module Varejonline
  module Entity
    module Administrative
      class Address < Base
        attr_accessor :tipo, :logradouro, :numero, :bairro, :complemento, :cep, :codigoIBGECidade, :tipoEndereco 
      end
    end
  end
end