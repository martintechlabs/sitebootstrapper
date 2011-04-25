require 'tmpdir'

module Sitebootstrapper
  module Generators
    class ViewsGenerator < Rails::Generators::Base
      source_root File.expand_path("../../../..", __FILE__)
      desc "Copies all Sitebootstrapper views and public files to your application."
      
      def copy_views
        directory "app/views/.", "app/views/"
        directory "public/.", "public/"
      end
      
    end
  end
end