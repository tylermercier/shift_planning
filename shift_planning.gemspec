# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'shift_planning/version'

Gem::Specification.new do |spec|
  spec.name          = "shift_planning"
  spec.version       = ShiftPlanning::VERSION
  spec.authors       = ["Tyler Mercier"]
  spec.email         = ["tylermercier@gmail.com"]
  spec.summary       = %q{Shift Planning API gem}
  spec.description   = %q{Shift Planning API gem}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "http"
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest-reporters"
  spec.add_development_dependency "webmock"
end
