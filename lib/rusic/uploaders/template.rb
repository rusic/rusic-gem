module Rusic
  module Uploaders
    class Template < Base
      def initialize(file, path)
        @file = file
        @path = path
      end

      def perform
        client["themes/#{theme}/templates/#{@path}"].put(params)
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
