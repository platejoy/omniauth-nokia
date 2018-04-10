# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'omniauth-nokia/version'

Gem::Specification.new do |s|
  s.name        = 'omniauth-nokia'
  s.version     = OmniAuth::Nokia::VERSION
  s.authors     = ['Daniel Nelson']
  s.email       = ['daniel@platejoy.com']
  s.homepage    = 'http://github.com/platejoy/omniauth-nokia'
  s.summary     = %q{OmniAuth OAuth2 strategy for Nokia}
  s.description = %q{OmniAuth OAuth2 strategy for Nokia}

  s.files         = `git ls-files`.split($\)
  s.executables   = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']

  s.add_runtime_dependency 'oauth', '~> 0.5'
  s.add_runtime_dependency 'omniauth-oauth', '~> 1.1'
  s.add_runtime_dependency 'multi_json'
end