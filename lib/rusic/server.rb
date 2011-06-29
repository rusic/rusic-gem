module Rusic
  class Server
    def self.call(env)
      [200, {'Content-Type' => 'text/plain'}, ["rusic.com"]]
    end
  end
end
