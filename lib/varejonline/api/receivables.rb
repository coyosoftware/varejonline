module Varejonline
  module API
    class Receivables < Client
      require_all 'varejonline/searcher/financial', 'receivable_searcher'

      base_uri "#{Varejonline::API_ADDRESS}/contas-receber"

      def list(searcher = nil)
        raise ArgumentError unless searcher.nil? || searcher.is_a?(Varejonline::Searcher::Financial::ReceivableSearcher)

        return parse_response(self.class.get('/', body: build_body(searcher.as_parameter), headers: header)) if searcher
        return parse_response(self.class.get('/', body: build_body, headers: header)) unless searcher
      end

      def find(id)
        return parse_response(self.class.get("/#{id}", body: build_body, headers: header))
      end      
    end
  end
end