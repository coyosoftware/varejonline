module Varejonline
  module API
    class CardNegotiations < Client
      require_all 'varejonline/entity/financial', 'card_negotiation'

      base_uri "#{Varejonline::API_ADDRESS}/negociacoes-cartao"

      def list
        return parse_response(self.class.get("/", body: build_body, headers: header))
      end
    end
  end
end