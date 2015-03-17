# TODO: Move keys into a YML file
# client = Twitter::REST::Client.new do |config|
#   config.consumer_key    = 'x6VTZfo3rJPUUVwJr9Sp7Wc7E'
#   config.consumer_secret = 'Uj4b8SZ4Zvze9s2tmsYOvODavYUpjU3alQIZaokwZia4MOGvSX'
# end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'x6VTZfo3rJPUUVwJr9Sp7Wc7E', 'Uj4b8SZ4Zvze9s2tmsYOvODavYUpjU3alQIZaokwZia4MOGvSX'
end