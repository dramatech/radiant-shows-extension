ActionController::Routing::Routes.draw do |map|
  map.namespace :admin, :member => { :remove => :get } do |admin|
    admin.resources :venues
    admin.resources :seating_types
    admin.resources :performances
    admin.resources :shows
  end
end
