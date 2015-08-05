module Rusic
  module Uploaders
    class CustomAttributes < Base
      def perform
        client["themes/#{theme}"].put(params)
      end

      private

      def message
        "Updating custom attributes"
      end

      def params
        params_hash = {
          'theme' => {
            'custom_attributes_attributes' => {}
          }
        }

        attributes_from_file.each_with_index do |(key, options), i|
          params_hash['theme']['custom_attributes_attributes'][i] = {
            'key' => key,
            'value' => options.fetch('value'),
            'help_text' => options.fetch('help_text', ''),
            'input_type' => options.fetch('type', 'text')
          }

          if options.fetch('select_options', nil)
            params_hash['theme']['custom_attributes_attributes'][i]['select_options'] = options.fetch('select_options')
          end

          if e_attr = existing_attributes[key]
            params_hash['theme']['custom_attributes_attributes'][i]['id'] = e_attr['id']
          end
        end
        params_hash
      end

      def existing_attributes
        @existing_attributes ||= JSON.parse(client["themes/#{theme}"].get)
        Hash[@existing_attributes.fetch('custom_attributes', []).map {|i| [i['key'], i] }]
      end

      def attributes_from_file
        ::YAML::load_file(file.file) || {}
      end
    end
  end
end
