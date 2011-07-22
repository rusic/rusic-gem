require 'sinatra/base'
require 'liquid'
require 'yaml'

module Rusic
  class Server < Sinatra::Base

    set :views, Dir.pwd

    set :public, Dir.pwd + '/public'

    enable :logging

    get '/' do
      liquid :"ideas/index.html", :layout => :"layouts/subdomain.html", :locals => { :rusic => YAML.load_file('rusic.yml')['bucket'] }
    end
  end
end
