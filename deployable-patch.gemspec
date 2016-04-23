# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'deployable/patch/version'

Gem::Specification.new do |spec|
  spec.name          = "deployable-patch"
  spec.version       = Deployable::Patch::VERSION
  spec.authors       = ["Deployable - Matt Hoyle"]
  spec.email         = ["code@deployable.co"]
  spec.summary       = %q{Central repo for monkey patches to other ruby stuff}
  spec.description   = %q{A central repo to store common monkey patches}
  spec.homepage      = "https://code.deployable.co/ruby/deployable-patch"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
