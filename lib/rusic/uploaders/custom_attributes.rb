require 'pry'
require 'awesome_print'

module Rusic
  module Uploaders
    class CustomAttributes < Base
      def perform
        client["themes/#{theme}/custom_attribute_collections"].post(params.to_json, content_type: :json)
      end

      def params
        parameters = {
          custom_attribute_collections: []
        }
        attribute_collections.each do |attribute_collection_key, attribute_collection|
          custom_attribute_collection = {
            key: attribute_collection_key,
            title: attribute_collection["title"],
            help_title: attribute_collection.fetch('help_title', nil),
            help_body: attribute_collection.fetch('help_body', nil),
            custom_attributes: [],
          }
          attribute_collection["attributes"].each do |attribute_key, attribute|
            custom_attribute_collection[:custom_attributes] << {
              'key' => attribute_key,
              'value' => attribute.fetch('value'),
              'help_text' => attribute.fetch('help_text', ''),
              'input_type' => attribute.fetch('type', 'string'),
              'select_options' => attribute.fetch('select_options', nil),
            }
          end
          parameters[:custom_attribute_collections] << custom_attribute_collection
        end
        parameters
      end

      private

      def message
        "Updating custom attributes"
      end

      def attribute_collections
        attributes_file["custom_attribute_collections"]
      end

      def attributes_file
        ::YAML::load_file(file.file) || {}
      end
    end
  end
end
