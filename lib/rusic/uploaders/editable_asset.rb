module Rusic
  module Uploaders
    class EditableAsset
      attr_accessor :file, :api_key, :theme

      def initialize(file)
        @file = file
      end

      def upload_file(options = {})
        @api_key = options.fetch('api_key')
        @theme = options.fetch('theme')

        case file.extname
        when '.css'
          client["themes/#{theme}/stylesheets/#{file.filename}"].put(params)

        when '.js'
          client["themes/#{theme}/javascripts/#{file.filename}"].put(params)

        end

        puts "Saved assets/#{file.filename}"
      end

      private

      def params
        { asset: { body: body} }
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
