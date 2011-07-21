# lib/generators/is_likeable/is_likeable_generator.rb
require 'rails/generators'
require 'rails/generators/migration'

class IsLikeableGenerator < Rails::Generators::Base
  include Rails::Generators::Migration
  
  source_root File.expand_path('../templates', __FILE__)
  
  # Implement the required interface for Rails::Generators::Migration.
  def self.next_migration_number(dirname)
    if ActiveRecord::Base.timestamped_migrations
      Time.now.utc.strftime("%Y%m%d%H%M%S")
    else
      "%.3d" % (current_migration_number(dirname) + 1)
    end
  end

  def create_migration_file
    migration_template 'migrations.rb', 'db/migrate/create_fb_likes.rb'
  rescue
    false # Fail quietly
  end
  
end