require 'pathname'

module Rusic
  class ThemeFile
    attr_reader :file

    def initialize(file)
      @file = file
    end

    def uploader
      case dirname
      when 'layouts', 'ideas', 'pages'
        Uploaders::Template.new(self)
      when 'assets'
        case extname
        when 'css', 'js'
          Uploaders::EditableAsset.new(self)
        else
          Uploaders::Asset.new(self)
        end
      end
    end

    def dirname
      pathname.dirname
    end

    def filename
      pathname.filename
    end

    def extname
      pathname.extname
    end

    def pathname
      Pathname.new(file)
    end
  end
end
