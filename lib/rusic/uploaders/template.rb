module Rusic
  module Uploaders
    class Template
      attr_accessor :file, :api_key, :theme

      def initialize(file)
        @file = file
      end

      def upload_file(options = {})
        @api_key = options.fetch('api_key')
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

        @client ||= RestClient::Resource.new('http://api.rusic.dev', headers: headers)
      end
    end
  end
end
