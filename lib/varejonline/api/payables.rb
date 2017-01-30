module Varejonline
  module API
    class Payables < Client
      require_all 'varejonline/searcher/financial', 'payable_searcher'

      base_uri "#{Varejonline::API_ADDRESS}/contas-pagar"

      def list(searcher = nil)
        raise ArgumentError unless searcher.nil? || searcher.is_a?(Varejonline::Searcher::Financial::PayableSearcher)

        return parse_response(self.class.get('/', body: build_body(searcher.as_parameter), headers: header)) if searcher
        return parse_response(self.class.get('/', body: build_body, headers: header)) unless searcher
      end

      def find(id)
        return parse_response(self.class.get("/#{id}", body: build_body, headers: header))
      end      
    end
  end
end