# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rusic/version'

Gem::Specification.new do |spec|
  spec.name          = "rusic"
  spec.version       = Rusic::VERSION
  spec.authors       = ['Chris Mytton', 'Paul Springett', 'Adam Butler', 'Peter Rhoades', 'Mark J Smith']
  spec.email         = ['self@hecticjeff.net', 'paul@simpleweb.co.uk', 'adam@lab.io', 'createdbypete@gmail.com', 'mark@markjs.net']
  spec.description   = 'Theme creation and deployment for the Rusic platform'
  spec.summary       = 'Generate and deploy themes to Rusic'
  spec.homepage      = 'http://docs.rusic.com/'
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'thor', '~> 0.14'
  spec.add_runtime_dependency 'rest-client', '~> 1.6'
  spec.add_runtime_dependency 'filewatcher', '~> 0.3'
  spec.add_runtime_dependency 'command_line_reporter', '~> 3.3'
  spec.add_runtime_dependency 'pry'
  spec.add_runtime_dependency 'awesome_print'

  spec.add_development_dependency 'rake'
end
