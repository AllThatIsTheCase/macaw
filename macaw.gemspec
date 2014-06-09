# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'macaw/version'

Gem::Specification.new do |spec|
  spec.name          = "macaw-ruby"
  spec.version       = Macaw::VERSION
  spec.executables   << 'macaw'
  spec.authors       = ["Emiliano Heyns"]
  spec.email         = ["Emiliano.Heyns@iris-advies.com"]
  spec.description   = %q{Ruby Arara}
  spec.summary       = %q{Ruby Arara}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_runtime_dependency 'json_pure'
  spec.add_runtime_dependency 'require_all'
  spec.add_runtime_dependency 'os'
  spec.add_runtime_dependency 'trollop'
  spec.add_runtime_dependency 'i18n'
end
