module Rusic
  module Uploaders
    class Asset < Base
      def perform
        client["themes/#{theme}/assets/#{file.filename}"].put(params)
      end

      private

      def params
        { asset: { image: image } }
      end

      def image
        File.open(file.pathname.to_s, 'rb')
      end
    end
  end
end
