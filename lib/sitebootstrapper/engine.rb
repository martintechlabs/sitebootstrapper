require("sitebootstrapper")
require("rails")

# Required to allow to override some methods in the app
require 'active_support/dependencies'
module ActiveSupport::Dependencies
  alias_method :require_or_load_without_multiple, :require_or_load
  def require_or_load(file_name, const_path = nil)
    if file_name.starts_with?(Rails.root.to_s + '/app')
      relative_name = file_name.gsub(Rails.root.to_s, '')
      @engine_paths ||= Rails::Application.railties.engines.collect{|engine| engine.config.root.to_s }
      @engine_paths.each do |path|
        engine_file = File.join(path, relative_name)
        require_or_load_without_multiple(engine_file, const_path) if File.file?(engine_file)
      end
    end
    require_or_load_without_multiple(file_name, const_path)
  end
end

module Sitebootstrapper
  class Engine < Rails::Engine
    # Fix a issue related to use haml in the app
    initializer 'custom initializer'  do |app|
      require 'haml'
      Haml.init_rails(binding)
    end

    # Allow the engine to shares assets with the app
    initializer "static assets" do |app|
      #app.middleware.insert_before(::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public")
      app.middleware.use ::ActionDispatch::Static, "#{root}/public"
    end

  end
end