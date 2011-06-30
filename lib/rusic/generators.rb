require 'thor/group'

module Rusic
  module Generators
    class New < Thor::Group
      include Thor::Actions

      argument :name, :type => :string

      def self.source_root
        File.dirname(__FILE__)
      end

      def create_project
        empty_directory(name)
      end

      def copy_rusic_yml
        template('templates/rusic.yml', "#{name}/rusic.yml")
      end

      def create_layout_directory
        empty_directory("#{name}/layouts")
      end

      def copy_layout
        template('templates/layouts/subdomain.html.liquid', "#{name}/layouts/subdomain.html.liquid")
      end

      def create_ideas_directory
        empty_directory("#{name}/ideas")
      end

      def copy_ideas_index
        template('templates/ideas/index.html.liquid', "#{name}/ideas/index.html.liquid")
      end

      def copy_ideas_new
        template('templates/ideas/new.html.liquid', "#{name}/ideas/new.html.liquid")
      end

      def copy_ideas_show
        template('templates/ideas/show.html.liquid', "#{name}/ideas/show.html.liquid")
      end

      def copy_ideas_edit
        template('templates/ideas/edit.html.liquid', "#{name}/ideas/edit.html.liquid")
      end
    end
  end
end
