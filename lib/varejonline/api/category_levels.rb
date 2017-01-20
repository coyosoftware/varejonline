module Varejonline
  module API
    class CategoryLevels < Client
      require_all 'varejonline/entity/operational', 'category_level'

      base_uri "#{Varejonline::API_ADDRESS}/niveis-categoria-produto"

      def list
        return parse_response(self.class.get("/", body: build_body, headers: header))
      end
    end
  end
end