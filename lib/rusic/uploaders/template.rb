module Rusic
  module Uploaders
    class Template
      attr_accessor :file, :api_key, :theme, :api_host

      def initialize(file)
        @file = file
      end

      def upload_file(options = {})
        @api_key = options.fetch('api_key')
        @api_host = options.fetch('api_host')
        @theme = options.fetch('theme')

        client["themes/#{theme}/templates/#{file.dirname}/#{file.filename}"].put(params)

        puts "Saved #{file.dirname}/#{file.filename}"
      end

      private

      def params
        { template: { body: body} }
      end

      def body
        File.read(file.pathname.to_s)
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
