module Varejonline
  module API
    class Units < Client
      require_all 'varejonline/entity/operational', 'unit'

      base_uri "#{Varejonline::API_ADDRESS}/unidades"

      def list
        return parse_response(self.class.get('/', body: build_body, headers: header))
      end

      def find(id)
        return parse_response(self.class.get("/#{id}", body: build_body, headers: header))
      end
    end
  end
end
