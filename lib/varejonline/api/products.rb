module Varejonline
  module API
    class Products < Client
      require_all 'varejonline/entity/commercial', 'product'

      base_uri "#{Varejonline::API_ADDRESS}/produtos"

      def save(data)
        return parse_response(self.class.post('/', body: build_body(data.as_parameter), headers: header))
      end
      
      def update(id, data)
        return parse_response(self.class.put("/#{id}", body: build_body(data.as_parameter), headers: header))
      end
    end
  end
end
