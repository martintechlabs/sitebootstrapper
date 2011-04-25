require 'tmpdir'

module Sitebootstrapper
  module Generators
    class ViewsGenerator < Rails::Generators::Base
      source_root File.expand_path("../../../../app/views", __FILE__)
      desc "Copies all Sitebootstrapper views to your application."
      
      def copy_views
        directory ".", "app/views/"
      end
    end
  end
end