require 'sinatra'
require 'omniauth-nokia'
require 'pry'

use Rack::Session::Cookie
use OmniAuth::Builder do
  provider :nokia,
    ENV['NOKIA_API_KEY'],
    ENV['NOKIA_API_SECRET']
end

get '/' do
  <<-HTML
  <a href='/auth/nokia'>Sign in with Nokia</a>
  HTML
end

get '/auth/nokia/callback' do
  nokia_params = request.env['omniauth.auth']

  ##################################
  ### Store these for future use ###
  nokia_user_id = nokia_params['uid']
  nokia_user_access_token = nokia_params['extra']['access_token'].token
  nokia_user_access_token_secret = nokia_params['extra']['access_token'].secret
  ### Store these for future use ###
  ##################################

  ###################################
  ### Interact with the Nokia API ###
  oauth_consumer = OAuth::Consumer.new(
    ENV['NOKIA_API_KEY'],
    ENV['NOKIA_API_SECRET'],
    OmniAuth::Strategies::Nokia.consumer_options,
  )

  api_access_token = OAuth::AccessToken.from_hash(oauth_consumer, {
    oauth_token: nokia_user_access_token,
    oauth_token_secret: nokia_user_access_token_secret,
  })

  # Change the uri to access other Nokia API endpoints
  uri = "https://api.health.nokia.com/measure?action=getmeas&userid=#{nokia_user_id}"

  request = api_access_token.get(uri)
  # MultiJson.load(request.body)

  ### Interact with the Nokia API ###
  ###################################

  request.body
end
