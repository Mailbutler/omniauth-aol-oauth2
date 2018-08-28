## omniauth-aol-oauth2 ##

An unofficial, Oauth2 OmniAuth strategy for AOL. 
Built using https://github.com/intridea/omniauth-oauth2.

## Setup ##
`gem install omniauth-aol-oauth2`

## Usage ##
```ruby
# In an initializer
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :aol_oauth2, aol_client_id, aol_client_secret,
    name: 'yaaolhoo'
end
```

See https://github.com/intridea/omniauth for Omniauth instructions.

## Notes ##
OmniAuth doesn't currently have built-in support for Basic Authentication for retrieving OAuth tokens, so `AolOauth2#build_access_token` handles this inline.

AOL returns an access_token, a refresh_token, and an expiration time for the access_token. They are available in the authentication hash in the callback:


## TODO ##
- Handle failure cases.
- Test something. Anything.
