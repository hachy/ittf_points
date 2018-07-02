# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ittf_points/version'

Gem::Specification.new do |spec|
  spec.name          = 'ittf_points'
  spec.version       = IttfPoints::VERSION
  spec.authors       = ['hachy']
  spec.email         = ['1613863+hachy@users.noreply.github.com']

  spec.summary       = %(Calculate rating points based on ITTF ranking system.)
  spec.description   = %(Calculate rating points based on ITTF ranking system.)
  spec.homepage      = 'https://github.com/hachy/ittf_points'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'thor'
  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
end
