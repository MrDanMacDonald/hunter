# TODO: Move keys into a YML file
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, Rails.application.secrets.twitter_api_key, Rails.application.secrets.twitter_api_secret,
  {
    image_size: 'original',
    authorize_params: {
      force_login: 'true'
    }
  }
end
