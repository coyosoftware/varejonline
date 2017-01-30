require "httparty"

module Varejonline
  class Client
    extend Varejonline::ClassMethods
    include HTTParty
    
    #debug_output $stdout
    
    default_options.update(verify: false)
    parser Proc.new {|b| JSON.parse(b) rescue b}
    
    require_all 'varejonline/api', 'third_parties', 'entities', 'default_entries', 'provisions', 'user_data', 'installments', 'credit_limits', 
      'client_classes', 'receivables', 'payables', 'sales_history', 'orders', 'companies', 'sellers', 'products', 'category_levels', 'product_categories',
      'payment_conditions'
    
    attr_accessor :access_token
    
    def initialize(access_token)
      raise NoAccessTokenError if access_token.nil? || access_token.strip == ""
      @access_token = access_token
    end
    
    def third_parties
      Varejonline::API::ThirdParties.new(@access_token)
    end
    
    def entities
      Varejonline::API::Entities.new(@access_token)
    end
    
    def default_entries
      Varejonline::API::DefaultEntries.new(@access_token)
    end
    
    def provisions
      Varejonline::API::Provisions.new(@access_token)
    end
    
    def user_data
      Varejonline::API::UserData.new(@access_token)
    end
    
    def installments
      Varejonline::API::Installments.new(@access_token)
    end

    def credit_limits
      Varejonline::API::CreditLimits.new(@access_token)
    end
    
    def receivables
      Varejonline::API::Receivables.new(@access_token)
    end

    def payables
      Varejonline::API::Payables.new(@access_token)
    end

    def client_classes
      Varejonline::API::ClientClasses.new(@access_token)
    end
    
    def sales_history
      Varejonline::API::SalesHistory.new(@access_token)
    end

    def orders
      Varejonline::API::Orders.new(@access_token)
    end

    def companies
      Varejonline::API::Companies.new(@access_token)
    end

    def sellers
      Varejonline::API::Sellers.new(@access_token)
    end
    
    def products
      Varejonline::API::Products.new(@access_token)
    end
    
    def category_levels
      Varejonline::API::CategoryLevels.new(@access_token)
    end
    
    def product_categories
      Varejonline::API::ProductCategories.new(@access_token)
    end

    def payment_conditions
      Varejonline::API::PaymentConditions.new(@access_token)
    end
    
    protected
      def header
        {'Content-Type' => 'application/json', 'Accept' => 'application/json'}
      end
      
      def build_body(parameters = {})
        parameters.merge(token: @access_token).to_json
      end
      
      def parse_response(response)
        return Varejonline::Client::Response.new(response)
      end
    
    class Response
      attr_accessor :status, :payload, :raw_response
      
      def initialize(response)
        @status = response.code
        @payload = response.parsed_response
        @raw_response = response
      end
    end
    
    class NoAccessTokenError < StandardError
      def message
        'Please provide an access token'
      end  
    end
  end
end