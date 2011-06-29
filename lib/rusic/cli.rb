require "thor"
require "rusic"

module Rusic
  class CLI < Thor
    desc "new NAME", "Create a new rusic theme"
    def new(name)
      Rusic::Generators::New.start([name])
    end
  end
end
