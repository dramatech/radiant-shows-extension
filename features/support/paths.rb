module NavigationHelpers
  
  # Extend the standard PathMatchers with your own paths
  # to be used in your features.
  # 
  # The keys and values here may be used in your standard web steps
  # Using:
  #
  #   When I go to the "shows" admin page
  # 
  # would direct the request to the path you provide in the value:
  # 
  #   admin_shows_path
  # 
  PathMatchers = {} unless defined?(PathMatchers)
  PathMatchers.merge!({
    # /shows/i => 'admin_shows_path'
  })
  
end

World(NavigationHelpers)