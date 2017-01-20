module Varejonline
  module API
    class ClientClasses < Client
      require_all 'varejonline/searcher/operational', 'client_class_searcher'

      base_uri "#{Varejonline::API_ADDRESS}/classificacoes-clientes"

      def list(searcher = nil)
        raise ArgumentError unless searcher.nil? || searcher.is_a?(Varejonline::Searcher::Operational::ClientClassSearcher)

        return parse_response(self.class.get('/', body: build_body(searcher.as_parameter), headers: header)) if searcher
        return parse_response(self.class.get('/', body: build_body, headers: header)) unless searcher
      end

      def find(id)
        return parse_response(self.class.get("/#{id}", body: build_body, headers: header))
      end
    end
  end
end