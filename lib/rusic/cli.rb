require 'thor'
require 'pathname'
require 'filewatcher'
require 'json'
require 'awesome_print'

module Rusic
  class CLI < Thor
    desc "new NAME", "Create a new Rusic theme"
    def new(name)
      Rusic::Generators::Theme.start([name])
    end

    desc "deploy", "Upload theme to Rusic"
    method_option :api_key, type: :string
    method_option :api_host, type: :string, default: 'api.rusic.com'
    method_option :theme, type: :string
    method_option :watch, type: :boolean
    def deploy
      path = Pathname.new('.')
      files = []

      files << Dir.glob(path.join('{layouts,ideas,pages}', '*.liquid'))
      files << Dir.glob(path.join('assets', '*.*'))

      files.flatten!

      if options[:watch]
        FileWatcher.new(%w[layouts/ ideas/ pages/ assets/]).watch(0.5) do |file, event|
          unless event == :delete
            deployer = Rusic::Deployer.new(file)
            deployer.upload_files(options)
          end
        end
      else
        deployer = Rusic::Deployer.new(files)
        deployer.upload_files(options)
      end
    end


    desc "settings", "Display settings from a .rusic file"

    def settings
      filename = '.rusic'

      if File.file?(filename)
        file = IO.read filename
        ap JSON.parse file
      else
        puts "The current directory does not contain an #{filename} file"
      end
    end

    desc "version", "Display version of Rusic gem"
    def version
      puts Rusic::VERSION
    end
  end
end
