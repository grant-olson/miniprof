# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'miniprof/version'

Gem::Specification.new do |spec|
  spec.name          = "miniprof"
  spec.version       = MiniProf::VERSION
  spec.authors       = ["Grant T. Olson"]
  spec.email         = ["kgo@grant-olson.net"]
  spec.summary       = %q{Simple tool to assist with manual profiling}
  spec.homepage      = ""
  spec.license       = "BSD"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
