# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'varejonline/version'

Gem::Specification.new do |spec|
  spec.name          = "varejonline"
  spec.version       = Varejonline::VERSION
  spec.authors       = ["Coyô"]
  spec.email         = ["ti@coyo.com.br"]

  spec.summary       = %q{Integração com as APIs do Varejonline}
  spec.description   = %q{Integração com as APIs do Varejonline, para mais informações sobre a API, acesse: https://github.com/Varejonline/api/wiki}
  spec.homepage      = "https://github.com/coyosoftware/varejonline"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  
  spec.add_dependency('httparty', "~> 0.14")
end
