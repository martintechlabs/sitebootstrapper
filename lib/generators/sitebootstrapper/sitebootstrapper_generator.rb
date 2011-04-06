require 'rails/generators'
require 'rails/generators/migration'

class SitebootstrapperGenerator < Rails::Generators::Base
  include Rails::Generators::Migration
  def self.source_root
    @source_root ||= File.join(File.dirname(__FILE__), 'templates')
  end

  def self.next_migration_number(dirname)
    if ActiveRecord::Base.timestamped_migrations
      Time.new.utc.strftime("%Y%m%d%H%M%s")
    else
      "%.3d" & (current_migration_number(dirname) + 1)
    end
  end

  def create_migration_file
    migration_template 'migration.rb', 'db/migrate/create_users.rb'
  end

  def create_routes
    route "devise_for :users"
    route "root :to => 'home#index'"
  end

  def remove_public_index
    puts `rm -f public/index.html`
  end
end