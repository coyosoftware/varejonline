module Varejonline
  module API
    class DefaultEntries < Client
      require_all 'varejonline/searcher/financial', 'default_entry_searcher'

      base_uri "#{Varejonline::API_ADDRESS}/lancamentos-padroes"

      def list(searcher = nil)
        raise ArgumentError unless searcher.nil? || searcher.is_a?(Varejonline::Searcher::Financial::DefaultEntrySearcher)

        return parse_response(self.class.get('/', body: build_body(searcher.as_parameter), headers: header)) if searcher
        return parse_response(self.class.get('/', body: build_body, headers: header)) unless searcher
      end

      def find(id)
        return parse_response(self.class.get("/#{id}", body: build_body, headers: header))
      end
    end
  end
end
