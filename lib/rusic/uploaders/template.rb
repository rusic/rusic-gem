module Rusic
  module Uploaders
    class Template < Base
      def perform
        client["themes/#{theme}/templates/#{file.dirname}/#{file.filename}"].put(params)
      end

      private

      def params
        { template: { body: body} }
      end

      def body
        File.read(file.pathname.to_s)
      end
    end
  end
end
