# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rusic/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Chris Mytton"]
  gem.email         = ["self@hecticjeff.net"]
  gem.description   = %q{Theming tool for rusic.com}
  gem.summary       = %q{Generate and manage themes for rusic.com, provides a local environment for rapid development}
  gem.homepage      = 'http://hq.rusic.com/theming'

  gem.add_dependency 'thor', '~> 0.14.6'
  gem.add_dependency 'sinatra', '~> 1.1.4'
  gem.add_dependency 'thin', '~> 1.2.11'
  gem.add_dependency 'liquid', '~> 2.2.2'

  gem.add_development_dependency 'rake', '~> 0.9.0'
  gem.add_development_dependency 'rspec', '~> 2.6.0'
  gem.add_development_dependency 'rack-test', '~> 0.6'
  gem.add_development_dependency 'cucumber', '~> 1.0'
  gem.add_development_dependency 'aruba', '~> 0.4.3'

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "rusic"
  gem.require_paths = ['lib']
  gem.version       = Rusic::VERSION
end
