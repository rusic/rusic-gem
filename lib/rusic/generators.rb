require 'thor'
require 'thor/group'

module Rusic
  module Generators
    class New < Thor::Group
      include Thor::Actions

      argument :name, type: :string

      def self.source_root
        File.dirname(__FILE__)
      end

      def create_project
        empty_directory(name)
      end

      def layout
        empty_directory("#{name}/layouts")
        template('templates/layouts/subdomain.html.liquid', "#{name}/layouts/subdomain.html.liquid")
      end

      def ideas
        empty_directory("#{name}/ideas")
        template('templates/ideas/index.html.liquid', "#{name}/ideas/index.html.liquid")
        template('templates/ideas/new.html.liquid', "#{name}/ideas/new.html.liquid")
        template('templates/ideas/show.html.liquid', "#{name}/ideas/show.html.liquid")
        template('templates/ideas/edit.html.liquid', "#{name}/ideas/edit.html.liquid")
      end

      def pages
        empty_directory("#{name}/pages")
        template('templates/pages/about.html.liquid', "#{name}/pages/about.html.liquid")
      end

      def assets
        empty_directory("#{name}/assets")
        template('templates/assets/bootstrap.css', "#{name}/assets/bootstrap.css")
        template('templates/assets/bootstrap.js', "#{name}/assets/bootstrap.js")
        template('templates/assets/cover.css', "#{name}/assets/cover.css")
        template('templates/assets/glyphicons-halflings-regular.eot', "#{name}/assets/glyphicons-halflings-regular.eot")
        template('templates/assets/glyphicons-halflings-regular.svg', "#{name}/assets/glyphicons-halflings-regular.svg")
        template('templates/assets/glyphicons-halflings-regular.ttf', "#{name}/assets/glyphicons-halflings-regular.ttf")
        template('templates/assets/glyphicons-halflings-regular.woff', "#{name}/assets/glyphicons-halflings-regular.woff")
      end
    end
  end
end
