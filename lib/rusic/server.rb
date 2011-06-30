require 'sinatra/base'
require 'liquid'

module Rusic
  class Server < Sinatra::Base

    set :views, Dir.pwd

    enable :logging

    get '/' do
      liquid :"ideas/index.html", :layout => :"layouts/subdomain.html", :locals => { :rusic => { :ideas => [{ :title => "thing"}]}}
    end
  end
end
