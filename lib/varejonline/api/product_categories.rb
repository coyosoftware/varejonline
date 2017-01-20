module Varejonline
  module API
    class ProductCategories < Client
      require_all 'varejonline/entity/operational', 'product_category'

      base_uri "#{Varejonline::API_ADDRESS}/categorias-produto"

      def list
        return parse_response(self.class.get('/', body: build_body, headers: header))
      end
    end
  end
end
