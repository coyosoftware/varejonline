require "varejonline/version"

module Varejonline
  LIBNAME = 'varejonline'
  LIBDIR = File.expand_path("../#{LIBNAME}", __FILE__)

  API_ADDRESS = "https://erp.varejonline.com.br/apps/api"
  
  class << self
    def included(base)
      base.extend ClassMethods
    end

    def new(access_token)
      Client.new(access_token)
    end
  end
  
  module ClassMethods
    # Requires internal libraries
    #
    # @param [String] prefix
    # the relative path prefix
    # @param [Array[String]] libs
    # the array of libraries to require
    #
    # @return [self]
    def require_all(prefix, *libs)
      libs.each do |lib|
        require "#{File.join(prefix, lib)}"
      end
    end
  end
  
  extend ClassMethods
  
  require_all LIBDIR, 'client'
end
