module Varejonline
  module API
    class CreditLimits < Client
      require_all 'varejonline/searcher/commercial', 'credit_limit_searcher'

      base_uri "#{Varejonline::API_ADDRESS}/limites_credito"

      def list(searcher = nil)
        raise ArgumentError unless searcher.nil? || searcher.is_a?(Varejonline::Searcher::Commercial::CreditLimitSearcher)

        return parse_response(self.class.get('/', body: build_body(searcher.as_parameter), headers: header)) if searcher
        return parse_response(self.class.get('/', body: build_body, headers: header)) unless searcher
      end

      def block_history(third_party_id, start_date, end_date)
        return parse_response(self.class.get('/historico_bloqueio', body: build_body({'desde' => start_date, 'ate' => end_date, 'idTerceiro' => third_party_id}), headers: header))
      end
    end
  end
end