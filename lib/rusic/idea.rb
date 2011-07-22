module Rusic
  class Idea < Hash
    def initialize(attrs = {})
      @attrs = attrs
    end

    def method_missing(method, *args)
      @attrs[method]
    end

    def permalink
      "/ideas/#{@attrs['id']}"
    end
  end
end
