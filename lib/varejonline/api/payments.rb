module Varejonline
  module API
    class Payments < Client
      base_uri "#{Varejonline::API_ADDRESS}/baixas"

      def create(data)
        return parse_response(self.class.post('/', body: build_body(data), headers: header))
      end
      alias :new :create
    end
  end
end