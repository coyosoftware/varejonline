module Varejonline
  module API
    class Products < Client
      require_all 'varejonline/searcher/commercial', 'product_searcher'
      require_all 'varejonline/entity/commercial', 'product'

      base_uri "#{Varejonline::API_ADDRESS}/produtos"

      def list(searcher = nil)
        raise ArgumentError unless searcher.nil? || searcher.is_a?(Varejonline::Searcher::Commercial::ProductSearcher)

        return parse_response(self.class.get('/', body: build_body(searcher.as_parameter), headers: header)) if searcher
        return parse_response(self.class.get('/', body: build_body, headers: header)) unless searcher
      end

      def find(id)
        return parse_response(self.class.get("/#{id}", body: build_body, headers: header))
      end

      def save(data)
        return parse_response(self.class.post('/', body: build_body(data.as_parameter), headers: header))
      end
      
      def update(id, data)
        return parse_response(self.class.put("/#{id}", body: build_body(data.as_parameter), headers: header))
      end
    end
  end
end
