module Varejonline
  module API
    class SalesHistory < Client
      base_uri "#{Varejonline::API_ADDRESS}/externa/historico-vendas-terceiro"

      def find(id)
        return parse_response(self.class.get("/buscar?terceiro=#{id}", body: build_body, headers: header))
      end

      def more_details(idTerceiro)
        return parse_response(self.class.get("/detalhar?terceiro=#{idTerceiro}", body: build_body, headers: header))
      end 
    end
  end
end