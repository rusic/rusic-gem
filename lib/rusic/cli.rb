require 'thor'
require 'pathname'
require 'filewatcher'

module Rusic
  class CLI < Thor
    def self.source_root
      File.dirname(__FILE__)
    end

    desc "new NAME", "Create a new Rusic theme"
    def new(name)
      Rusic::Generators::Theme.start([name])
    end

    desc "deploy PATH", "Upload theme to Rusic"
    method_option :api_key, type: :string
    method_option :theme, type: :string
    method_option :watch, type: :boolean
    def deploy(path = '.')
      path = Pathname.new(path)
      files = []

      files << Dir.glob(path.join('{layouts,ideas,pages}', '*.liquid'))
      files << Dir.glob(path.join('assets', '*.*'))

      files.flatten!

      if options[:watch]
        FileWatcher.new(files).watch(0.5) do |file|
          deployer = Rusic::Deployer.new(file)
          deployer.upload_files(options)
        end
      else
        deployer = Rusic::Deployer.new(files)
        deployer.upload_files(options)
      end
    end
  end
end
