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

        # PUT api.rusic.com/themes/123/assets/bg.png
        # client.themes(theme).assets(filename).update!(body: body)
        puts "PUT api.rusic.com/themes/#{theme}/assets/#{file.filename}"

      end

      private

      def body
        File.read(file.pathname.to_s)
      end

      def client
        Rusic::API::Client.new(api_key: api_key)
      end
    end
  end
end
