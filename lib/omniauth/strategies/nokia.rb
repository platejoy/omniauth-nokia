require 'multi_json'
require 'omniauth-oauth'

module OmniAuth
  module Strategies
    class Nokia < OmniAuth::Strategies::OAuth

      def self.consumer_options
        {
          site: 'https://developer.health.nokia.com',
          signature_method: 'HMAC-SHA1',
          request_token_path: '/account/request_token',
          authorize_path: '/account/authorize',
          access_token_path: '/account/access_token',
          scheme: 'query_string',
          http_method: 'get',
          debug_output: true,
        }
      end

      # Give your strategy a name.
      option :name, 'nokia'

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, OmniAuth::Strategies::Nokia.consumer_options

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      uid { request.params['userid'] }

      credentials do
        {
          token: request.params['oauth_token'],
          secret: request.params['oauth_verifier'],
        }
      end

      # extra do
      #   {
      #     # raw_info: raw_info,
      #     raw_info: {},
      #   }
      # end

      # def raw_info
      #   url = 'https://api.health.nokia.com/measure'
      #   @raw_info ||= MultiJson.load(access_token.get(url).body)
      # end
    end
  end
end
