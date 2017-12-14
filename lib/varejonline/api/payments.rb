module Varejonline
  module API
    class Payments < Client
      require_all 'varejonline/searcher/financial', 'payment_searcher'

      base_uri "#{Varejonline::API_ADDRESS}/baixas"

      def list(searcher = nil)
        raise ArgumentError unless searcher.nil? || searcher.is_a?(Varejonline::Searcher::Financial::PaymentSearcher)

        return parse_response(self.class.get('/', body: build_body(searcher.as_parameter), headers: header)) if searcher
        return parse_response(self.class.get('/', body: build_body, headers: header)) unless searcher
      end

      def find(id)
        return parse_response(self.class.get("/#{id}", body: build_body, headers: header))
      end

      def create(data)
        return parse_response(self.class.post('/', body: build_body(data), headers: header))
      end
      alias :new :create
    end
  end
end