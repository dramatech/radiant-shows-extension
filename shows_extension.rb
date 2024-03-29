# Uncomment this if you reference any of your controllers in activate
# require_dependency "application_controller"
require "radiant-shows-extension"

class ShowsExtension < Radiant::Extension
  version     RadiantShowsExtension::VERSION
  description RadiantShowsExtension::DESCRIPTION
  url         RadiantShowsExtension::URL

  # See your config/routes.rb file in this extension to define custom routes

  extension_config do |config|
    # config is the Radiant.configuration object
  end

  def activate
    tab "shows.shows", :after => "Content" do
      add_item "shows.shows", "/admin/shows"
      add_item "venues.venues", "/admin/venues"
    end
  end
end
