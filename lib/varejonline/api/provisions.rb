module Varejonline
  module API
    class Provisions < Client
      base_uri "#{Varejonline::API_ADDRESS}/provisoes-contas"

      def create(data)
        return parse_response(self.class.post('/', body: build_body(data), headers: header))
      end
      alias :new :create
    end
  end
end