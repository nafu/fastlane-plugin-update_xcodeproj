# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/update_xcodeproj/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-update_xcodeproj'
  spec.version       = Fastlane::UpdateXcodeproj::VERSION
  spec.author        = %q{Fumiya Nakamura}
  spec.email         = %q{nakamurafumiya003@gmail.com}

  spec.summary       = %q{Update Xcode projects}
  spec.homepage      = "https://github.com/nafu/fastlane-plugin-update_xcodeproj"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"] + %w(README.md LICENSE)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  # spec.add_dependency 'your-dependency', '~> 1.0.0'

  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'fastlane', '>= 1.102.0'
end
