require 'thor'
require 'thor/group'

module Rusic
  module Generators
    class Theme < Thor::Group
      include Thor::Actions

      argument :name, type: :string

      def self.source_root
        File.dirname(__FILE__) + '/..'
      end

      def create_project
        empty_directory(name)
      end

      def git
        copy_file('templates/gitignore', "#{name}/.gitignore")
      end

      def readme
        template('templates/README.md', "#{name}/README.md", name: name)
      end

      def layout
        empty_directory("#{name}/layouts")
        copy_file('templates/layouts/subdomain.html.liquid', "#{name}/layouts/subdomain.html.liquid")
      end

      def ideas
        empty_directory("#{name}/ideas")
        copy_file('templates/ideas/index.html.liquid', "#{name}/ideas/index.html.liquid")
        copy_file('templates/ideas/new.html.liquid', "#{name}/ideas/new.html.liquid")
        copy_file('templates/ideas/show.html.liquid', "#{name}/ideas/show.html.liquid")
        copy_file('templates/ideas/edit.html.liquid', "#{name}/ideas/edit.html.liquid")
      end

      def pages
        empty_directory("#{name}/pages")
        copy_file('templates/pages/about.html.liquid', "#{name}/pages/about.html.liquid")
      end

      def snippets
        empty_directory("#{name}/snippets")
        copy_file('templates/snippets/navigation.html.liquid', "#{name}/snippets/navigation.html.liquid")
      end

      def assets
        empty_directory("#{name}/assets")
        copy_file('templates/assets/bootstrap.css', "#{name}/assets/bootstrap.css")
        copy_file('templates/assets/bootstrap.js', "#{name}/assets/bootstrap.js")
        copy_file('templates/assets/cover.css', "#{name}/assets/cover.css")
        copy_file('templates/assets/glyphicons-halflings-regular.eot', "#{name}/assets/glyphicons-halflings-regular.eot")
        copy_file('templates/assets/glyphicons-halflings-regular.svg', "#{name}/assets/glyphicons-halflings-regular.svg")
        copy_file('templates/assets/glyphicons-halflings-regular.ttf', "#{name}/assets/glyphicons-halflings-regular.ttf")
        copy_file('templates/assets/glyphicons-halflings-regular.woff', "#{name}/assets/glyphicons-halflings-regular.woff")
      end
    end
  end
end
