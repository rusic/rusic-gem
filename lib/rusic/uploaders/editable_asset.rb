module Rusic
  module Uploaders
    class EditableAsset < Base
      def perform
        case file.extname
        when '.css'
          client["themes/#{theme}/stylesheets/#{file.filename}"].put(params)
        when '.js'
          client["themes/#{theme}/javascripts/#{file.filename}"].put(params)
        end
      end

      private

      def params
        { asset: { body: body} }
      end

      def body
        File.read(file.pathname.to_s)
      end
    end
  end
end
