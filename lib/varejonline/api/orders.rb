module Varejonline
  module API
    class Orders < Client
      require_all 'varejonline/searcher/operational', 'order_searcher'
      require_all 'varejonline/entity/commercial', 'order', 'item'

      base_uri "#{Varejonline::API_ADDRESS}/pedidos"

      def list(searcher = nil)
        raise ArgumentError unless searcher.nil? || searcher.is_a?(Varejonline::Searcher::Operational::OrderSearcher)

        return parse_response(self.class.get('/', body: build_body(searcher.as_parameter), headers: header)) if searcher
        return parse_response(self.class.get('/', body: build_body, headers: header)) unless searcher
      end

      def find(id)
        return parse_response(self.class.get("/#{id}", body: build_body, headers: header))
      end

      def save(data)
        return parse_response(self.class.post('/', body: build_body(data), headers: header))              if data.is_a?(Hash)
        return parse_response(self.class.post('/', body: build_body(data.as_parameter), headers: header)) if data.is_a?(Varejonline::Entity::Commercial::Order)

        raise ArgumentError
      end
      alias :create :save

      def cancel(id)
        return parse_response(self.class.post("/#{id}/cancelar", body: build_body, headers: header))
      end
    end
  end
end
