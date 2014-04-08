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
    rescue RestClient::Unauthorized
      puts
      puts '401 Unauthorized. Ensure your API Key is set correctly.'
      exit(1)
    rescue RestClient::ResourceNotFound
      puts
      puts '404 Not Found. Ensure you are have permission to access the given theme'
      exit(1)
    end
  end
end
