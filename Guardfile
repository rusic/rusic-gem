require './lib/rusic/version'

guard :shell do
  watch(%r{lib/.*}) {
    `gem build ./rusic.gemspec`
    `gem install rusic-#{Rusic::VERSION}.gem`
    `rm rusic-#{Rusic::VERSION}.gem`
  }
end
