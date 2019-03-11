# frozen_string_literal: true

require 'omniauth/strategies/oauth2'
require 'base64'

module OmniAuth
  module Strategies
    class AolOauth2 < OmniAuth::Strategies::OAuth2
      option :name, 'aol_oauth2'

      option :client_options,
             site: 'https://api.login.aol.com',
             authorize_url: '/oauth2/request_auth',
             token_url: '/oauth2/get_token'

      uid { raw_profile_info['sub'] }

      info do
        {
          email: raw_profile_info['email'],
          name: raw_profile_info['name'],
          extra: {
            raw_info: raw_profile_info
          }
        }
      end

      def callback_url
        options[:redirect_uri] || (full_host + script_name + callback_path)
      end

      def build_access_token
        verifier = request.params['code']
        auth = "Basic #{Base64.strict_encode64("#{options.client_id}:#{options.client_secret}")}"

        params = { headers: { 'Authorization': auth }, parse: :json, redirect_uri: callback_url }.merge(token_params.to_hash(symbolize_keys: true))
        client.auth_code.get_token(verifier, params, deep_symbolize(options.auth_token_params))
      end

      def raw_profile_info
        @raw_profile_info ||= access_token.get('https://api.login.aol.com/openid/v1/userinfo').parsed
      end
    end
  end
end
