# TODO: Move keys into a YML file
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'x6VTZfo3rJPUUVwJr9Sp7Wc7E', 'Uj4b8SZ4Zvze9s2tmsYOvODavYUpjU3alQIZaokwZia4MOGvSX',
  {
    image_size: 'original',
    authorize_params: {
      force_login: 'true'
    }
  }
end
