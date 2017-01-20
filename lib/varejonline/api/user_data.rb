module Varejonline
  module API
    class UserData < Client
      base_uri "#{Varejonline::API_ADDRESS}/dados-login"

      def get
        return parse_response(self.class.get('/', body: build_body, headers: header))
      end
    end
  end
end