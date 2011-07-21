#config/routes.rb
Rails.application.routes.draw do |map|
  resources :fb_likes, :controller => 'is_likeable/fb_likes', :only => [:show]
end
