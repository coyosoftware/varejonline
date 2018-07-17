module Varejonline
  module API
    class ProductBalances < Client
      require_all 'varejonline/searcher/operational', 'product_balance_searcher'

      base_uri "#{Varejonline::API_ADDRESS}/saldos-mercadorias"

      def list(searcher = nil)
        raise ArgumentError unless searcher.nil? || searcher.is_a?(Varejonline::Searcher::Operational::ProductBalanceSearcher)

        return parse_response(self.class.get('/', body: build_body(searcher.as_parameter), headers: header)) if searcher
        return parse_response(self.class.get('/', body: build_body, headers: header)) unless searcher
      end
    end
  end
end