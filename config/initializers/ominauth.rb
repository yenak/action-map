Rails.application.config.middleware.use OmniAuth::Builder do
  config = Settings.default["oauth2"]
  # provider :google_oauth2, config["client_id"],
  #                         config["client_secret"],
  #                         image_size: 150
  # UNCOMMENT THIS AND COMMENT THE BELOW LINES TO USE GOOGLE AUTH
  # Workaround for tests until we can manage google api key
  provider :google_oauth2, 0,
                           0,
                           image_size: 150

end