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

        # PUT api.rusic.com/themes/123/templates/ideas/index.html.liquid
        # client.themes(theme).templates("#{dirname}/#{filename}").update!(body: body)
        puts "PUT api.rusic.com/themes/#{theme}/templates/#{file.dirname}/#{file.filename}"

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
