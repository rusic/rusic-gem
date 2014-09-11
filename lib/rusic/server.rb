require 'webrick'
require 'liquid'
require 'yaml'

module Rusic
  class Server
    def self.start
      Liquid::Template.register_filter(RusicFilters)
      s = WEBrick::HTTPServer.new(Server.server_options)
      s.unmount("")

      s.mount '/assets', WEBrick::HTTPServlet::FileHandler, 'assets'
      s.mount '/ideas/1', Rusic::Server::IdeaHandler, liquid_variables
      s.mount '/', Rusic::Server::LiquidHandler, liquid_variables

      t = Thread.new { s.start }
      trap("INT") { s.shutdown }
      t.join
    end

    def self.server_options
      {
        :Port => 4567,
        :DocumentRoot => Dir.pwd,
        :AccessLog => []
      }
    end

    def self.liquid_variables
      ::YAML::load_file(File.expand_path('../fixtures.yml', __FILE__)) || {}
    end

    class LiquidHandler < WEBrick::HTTPServlet::AbstractServlet
      def initialize(server, *options)
        super(server, options)
        @lvars = options.first
      end

      def do_GET(req, res)
        res.body = render(req)
        res['content-type'] ||= 'text/html'
      end

      protected

      def render(req)
        tmpl = Liquid::Template.parse(File.read('layouts/subdomain.html.liquid'))
        if req.path.size < 2
          tmpl.render(@lvars.merge('content_for_layout' => ''))
        else
          path = req.path[1..-1].split('/')
          path_with_ext = path.dup
          path_with_ext[-1] = "#{path_with_ext.last}.html.liquid"
          if File.exists?(File.join(path_with_ext))
            view_file = File.join(path_with_ext)
          else
            view_file = File.join(path, 'index.html.liquid')
          end
          partial = Liquid::Template.parse(File.read(view_file))
          tmpl.render(@lvars.merge('content_for_layout' => partial.render(@lvars)))
        end
      end
    end

    class IdeaHandler < LiquidHandler

      def do_POST(req, res)
        res.set_redirect WEBrick::HTTPStatus::TemporaryRedirect, '/ideas/1'
      end

      protected

      def render(req)
        tmpl = Liquid::Template.parse(File.read('layouts/subdomain.html.liquid'))
        partial = Liquid::Template.parse(File.read('ideas/show.html.liquid'))
        tmpl.render(@lvars.merge('content_for_layout' => partial.render(@lvars)))
      end
    end

    module RusicFilters
      def asset_url(name)
        "/assets/#{name}"
      end

      alias_method :stylesheet_url, :asset_url
      alias_method :javascript_url, :asset_url
    end
  end
end
