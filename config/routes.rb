ActionController::Routing::Routes.draw do |map|
  # map.namespace :admin, :member => { :remove => :get } do |admin|
  #   admin.resources :shows
  # end
  map.namespace :admin, :member => { :remove => :get } do |admin|
    admin.resources :venues
  end
end
