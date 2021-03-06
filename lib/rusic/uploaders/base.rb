module Rusic
  module Uploaders
    class Base
      include CommandLineReporter

      attr_accessor :file, :api_key, :theme, :api_host

      def initialize(file)
        @file = file
      end

      def upload_file(options = {})
        @api_key = options.fetch('api_key')
        @api_host = options.fetch('api_host', 'api.rusic.com')
        @theme = options.fetch('theme')

        report(message: message, complete: '', type: 'inline', indent_size: 2) do
          begin
            perform
            print(' [done]'.green)
          rescue RestClient::UnprocessableEntity, RestClient::Exception => e
            puts e
            print(' [failed]'.red)
          end
        end
      rescue KeyError => e
        puts
        puts e.message
        exit(1)
      end

      def perform
        fail NotImplementedError, 'define a #perform method on your uploader'
      end

      protected

      def message
        "Uploading #{file.descriptor}"
      end

      def client
        headers = {
          'X-API-Key' => api_key,
          'Accept' => 'application/vnd.rusic.v1+json'
        }

        @client ||= RestClient::Resource.new("http://#{api_host}", headers: headers)
      end
    end
  end
end
