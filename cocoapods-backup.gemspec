# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cocoapods-backup/gem_version.rb'

Gem::Specification.new do |spec|
  spec.name          = 'cocoapods-backup'
  spec.version       = '0.0.2'
  spec.authors       = ['kingcos']
  spec.email         = ['2821836721v@gmail.com']
  spec.description   = %q{Using current sources for your pods.}
  spec.summary       = %q{Using current sources for your pods.}
  spec.homepage      = 'https://github.com/kingcos/cocoapods-backup'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
