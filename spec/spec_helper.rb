require "simplecov"
SimpleCov.start

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'varejonline'
require 'webmock/rspec'

WebMock.disable_net_connect!(allow: 'codeclimate.com')

RSpec.configure do |config|
  config.mock_with :rspec
end
