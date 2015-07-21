require 'pathname'

module Rusic
  class ThemeFile
    attr_reader :file

    def initialize(file)
      @file = file
    end

    def uploader
      case "#{dirname.basename}"
      when 'layouts', 'ideas', 'pages', 'participant', 'snippets', 'mailers'
        uploader = Uploaders::Template.new(self)
      when 'assets'
        case extname
        when '.css', '.js'
          uploader = Uploaders::EditableAsset.new(self)
        else
          uploader = Uploaders::Asset.new(self)
        end
      else
        case filename.to_s
        when /attributes\.ya?ml/
          uploader = Uploaders::CustomAttributes.new(self)
        end
      end

      uploader
    end

    def descriptor
      "#{dirname}/#{filename}"
    end

    def dirname
      pathname.dirname
    end

    def filename
      pathname.basename
    end

    def extname
      pathname.extname
    end

    def pathname
      Pathname.new(file)
    end
  end
end
