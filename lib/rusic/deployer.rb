module Rusic
  class Deployer
    attr_reader :files

    def initialize(files)
      @files = Array(files).map { |file| ThemeFile.new(file) }
    end

    def upload_files(options = {})
      files.each do |file|
        file.uploader.upload_file(options)
      end
    end
  end
end
