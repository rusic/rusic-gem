module Rusic
  module Uploaders
    class CustomAttributes < Base
      def perform
        client["themes/#{theme}"].put(params)
      end

      def upload_file(options = {})
        @api_key = options.fetch('api_key')
        @api_host = options.fetch('api_host')
        @theme = options.fetch('theme')

        report(message: "Syncing custom attributes", complete: '', type: 'inline', indent_size: 2) do
          begin
            perform
            print(' [done]'.green)
          rescue RestClient::UnprocessableEntity
            print(' [failed]'.red)
          end
        end
      rescue KeyError => e
        puts
        puts e.message
        exit(1)
      end

      private

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
            'help_text' => options.fetch('help_text', '')
          }

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
        ::YAML::load_file(file.file)
      end
    end
  end
end
