# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rusic/version'

Gem::Specification.new do |spec|
  spec.name          = "rusic"
  spec.version       = Rusic::VERSION
  spec.authors       = ['Chris Mytton', 'Paul Springett']
  spec.email         = ['self@hecticjeff.net', 'paul@simpleweb.co.uk']
  spec.description   = 'Theme creation and deployment'
  spec.summary       = 'Generate and deploy themes to Rusic'
  spec.homepage      = 'http://developer.rusic.com/'
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'thor', '~> 0.14.6'
  spec.add_runtime_dependency 'rest-client', '~> 1.6'
  spec.add_runtime_dependency 'filewatcher', '~> 0.3'
  spec.add_runtime_dependency 'command_line_reporter', '~> 3.3'

  spec.add_development_dependency 'rake', '~> 0.9.0'
  spec.add_development_dependency 'rspec', '~> 2.6.0'
  spec.add_development_dependency 'rack-test', '~> 0.6'
end
