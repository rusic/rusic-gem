module Rusic
  module Uploaders
    class EditableAsset
      attr_accessor :file, :api_key, :theme

      def initialize(file)
        @file = file
      end

      def upload_file(options = {})
        @api_key = options.fetch(:api_key)
        @theme = options.fetch(:theme)

        case file.extname
        when 'css'
          # PUT api.rusic.com/themes/123/stylesheets/style.css
          # client.themes(theme).stylesheets(filename).update!(body: body)
          puts "PUT api.rusic.com/themes/#{theme}/stylesheets/#{filename}"

        when 'js'
          # PUT api.rusic.com/themes/123/javascripts/style.css
          # client.themes(theme).javascripts(filename).update!(body: body)
          puts "PUT api.rusic.com/themes/#{theme}/javascripts/#{filename}"

        end
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
