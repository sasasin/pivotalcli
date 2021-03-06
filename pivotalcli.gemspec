# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pivotalcli/version'

Gem::Specification.new do |spec|
  spec.name          = "pivotalcli"
  spec.version       = Pivotalcli::VERSION
  spec.authors       = ["Shinnosuke Suzuki"]
  spec.email         = ["sasasin@sasasin.net"]

  spec.summary       = "CLI tool for PivotalTracker."
  spec.description   = "CLI tool for PivotalTracker."
  spec.homepage      = "https://github.com/sasasin/pivotalcli"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.1"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency "thor"
  spec.add_dependency "tracker_api"
end
