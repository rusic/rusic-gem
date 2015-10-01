require 'pathname'

module Rusic
  class ThemeFile
    attr_reader :file

    def initialize(file)
      @file = file
    end

    def uploader
      case root_name
      when 'layouts', 'ideas', 'pages', 'participant', 'snippets', 'mailers', 'reports'
        uploader = Uploaders::Template.new(self, relative_path)
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

    def root_name
      relative_path.each_filename.first
    end

    def directory
      relative_path.to_s.chomp(filename.to_s)
    end

    def relative_path
      pathname.relative_path_from(working_directory)
    end

    def working_directory
      Pathname.new(Dir.pwd)
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
