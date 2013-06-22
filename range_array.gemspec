# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'range_array/version'

Gem::Specification.new do |spec|
  spec.name          = "range_array"
  spec.version       = RangeArray::VERSION
  spec.authors       = ["Steve Flinter"]
  spec.email         = ["stephen@flinter.com"]
  spec.description   = %q{Gem to create and manage an array of ranges}
  spec.summary       = %q{Gem to create and manage an array of ranges}
  spec.homepage      = "https://github.com/sflinter/range_array"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
