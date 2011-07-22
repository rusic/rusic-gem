module Rusic
  class Idea < Hash
    def initialize(attrs = {})
      @attrs = attrs
      self['permalink'] = "/ideas/#{@attrs['id']}"
    end
  end
end
