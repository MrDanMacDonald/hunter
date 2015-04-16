# TODO: Move keys into a YML file
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV["TWITTER_API_KEY"], ENV["TWITTER_API_SECRET"],
  {
    image_size: "original",
    authorize_params: {
      force_login: "true"
    }
  }
end
