module Rusic
  class Idea < Hash
    def initialize(attrs = {})
      self.merge!(attrs)
      self['permalink'] = "/ideas/#{self['id']}"
    end
  end
end
