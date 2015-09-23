require './app'

# This isn't valid Rack, but we do this to work around rackup not having
# a way to set a default bind address...
Sinatra::Application.run!
exit
