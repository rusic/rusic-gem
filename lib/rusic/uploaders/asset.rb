module Rusic
  module Uploaders
    class Asset
      attr_accessor :file, :api_key, :theme

      def initialize(file)
        @file = file
      end

      def upload_file(options = {})
        @api_key = options.fetch('api_key')
        @theme = options.fetch('theme')

        client["themes/#{theme}/assets/#{file.filename}"].put(params)

        puts "Saved assets/#{file.filename}"
      end

      private

      def params
        { asset: { image: file } }
      end

      def file
        File.open(file.pathname.to_s, 'rb')
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
