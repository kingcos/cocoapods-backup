# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cocoapods-local-backup/gem_version.rb'

Gem::Specification.new do |spec|
  spec.name          = 'cocoapods-local-backup'
  spec.version       = CocoapodsLocalBackup::VERSION
  spec.authors       = ['kingcos']
  spec.email         = ['2821836721v@gmail.com']
  spec.description   = %q{A short description of cocoapods-local-backup.}
  spec.summary       = %q{A longer description of cocoapods-local-backup.}
  spec.homepage      = 'https://github.com/EXAMPLE/cocoapods-local-backup'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
