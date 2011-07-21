#lib/is_likeable/engine.rb
require 'is_likeable'
require 'rails'
require 'paperclip'

module IsLikeable
 class Engine < Rails::Engine
   
   
   Dir[File.dirname(__FILE__) + "/../../app/helpers/**/*_helper.rb"].each { |file| require file }   #require all helpers
   ActionView::Base.send :include, IsLikeable::FbLikeHelper                                         # include FbLikeHelper
   
   rake_tasks do
     load 'is_likeable/railties/tasks.rake'
   end
   
  end
end
