require 'thor'
require 'pathname'
require 'filewatcher'
require 'yaml'

module Rusic
  class CLI < Thor
    desc "new NAME", "Create a new Rusic theme"
    def new(name)
      Rusic::Generators::Theme.start([name])
    end

    desc "deploy [ENV]", "Upload theme to Rusic"
    method_option :api_key, type: :string
    method_option :api_host, type: :string, default: 'api.rusic.com'
    method_option :theme, type: :string
    method_option :watch, type: :boolean

    def deploy(env = nil)
      path = Pathname.new(Dir.pwd)
      files = []

      files << Dir.glob(path.join('{layouts,ideas,pages}', '*.liquid'))
      files << Dir.glob(path.join('assets', '*.*'))
      files << Dir.glob(path.join('attributes.{yml,yaml}'))

      files.flatten!
      if options['watch']
        FileWatcher.new(%w[layouts/ ideas/ pages/ assets/]).watch(0.5) do |file, event|
          unless event == :delete
            deployer = Rusic::Deployer.new(file)
            deployer.upload_files(deploy_options_for(env))
          end
        end
      else
        deployer = Rusic::Deployer.new(files)
        deployer.upload_files(deploy_options_for(env))
      end
    end

    desc "version", "Display version of Rusic gem"
    def version
      puts Rusic::VERSION
    end

    private

    def deploy_options_for(env)
      environment_options = options_from_file
      environment_options.merge!(options_from_file.fetch(env, {}))
      Thor::CoreExt::HashWithIndifferentAccess.new(environment_options.merge(options))
    end

    def options_from_file
      config_file = Dir.glob(File.join(Dir.pwd, '.rusic{,.yml,.yaml}')).first
      return {} unless config_file
      ::YAML::load_file(config_file) || {}
    end
  end
end
