# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'eye/notify/eye_slack/version'

Gem::Specification.new do |spec|
  spec.name          = "eye-slack"
  spec.version       = Eye::Notify::EyeSlack::VERSION
  spec.authors       = ["Tom Meinlschmidt"]
  spec.email         = ["tomas@meinlschmidt.org"]
  spec.summary       = %q{Eye to Slack notification}
  spec.description   = %q{Eye to Slack notification}
  spec.homepage      = "https://github.com/tmeinlschmidt/eye-slack"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_runtime_dependency "slack-notifier", "~> 1.2.1"
  spec.add_runtime_dependency "eye", ">= 0.6"

end
