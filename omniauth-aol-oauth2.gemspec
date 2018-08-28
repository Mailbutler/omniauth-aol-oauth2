require File.expand_path(File.join('..', 'lib', 'omniauth', 'aol_oauth2', 'version'), __FILE__)

Gem::Specification.new do |gem|
  gem.add_runtime_dependency 'omniauth', '~> 1.1'
  gem.add_runtime_dependency 'omniauth-oauth2', '~> 1.1'
  gem.add_development_dependency 'bundler', '~> 1.0'

  gem.authors       = ['Fabian Jäger']
  gem.email         = ['fabian@mailbutler.io']
  gem.description   = 'An AOL OAuth2 strategy for OmniAuth.'
  gem.summary       = gem.description
  gem.homepage      = 'https://github.com/Mailbutler/omniauth-aol-oauth2'
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split("\n")
  gem.name          = 'omniauth-aol-oauth2'
  gem.require_paths = ['lib']
  gem.version       = OmniAuth::AolOauth2::VERSION
end
