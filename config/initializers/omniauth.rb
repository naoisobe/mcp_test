Rails.application.config.middleware.use OmniAuth::Builder do
  # Google OAuth2
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'], {
    scope: 'email,profile',
    prompt: 'select_account'
  }
  
  # GitHub OAuth
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], {
    scope: 'user:email'
  }
  
  # Twitter OAuth
  provider :twitter, ENV['TWITTER_API_KEY'], ENV['TWITTER_API_SECRET']
  
  # OmniAuth Error Handling
  OmniAuth.config.on_failure = Proc.new do |env|
    OmniAuth::FailureEndpoint.new(env).redirect_to_failure
  end
end
