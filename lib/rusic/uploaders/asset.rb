module Rusic
  module Uploaders
    class Asset < Base
      def perform
        client["themes/#{theme}/assets/#{file.filename}"].put(params)
      end

      private

      def params
        { asset: { file: asset } }
      end

      def asset
        File.open(file.pathname.to_s, 'rb')
      end
    end
  end
end
