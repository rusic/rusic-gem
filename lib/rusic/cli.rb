require "thor"

module Rusic
  class CLI < Thor
    desc "new NAME", "Create a new rusic theme"
    def new(name)
      puts "generating ideas templates for #{name}"
    end
  end
end
