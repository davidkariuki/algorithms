lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "algorithms/version"

Gem::Specification.new do |spec|
  spec.name = "algorithms"
  spec.version = Algorithms::VERSION
  spec.authors = ["David Kariukí"]
  spec.email = ["dkariuki@gmail.com"]
  spec.summary = "Algorithm of algorithms algorithm"
  spec.description = "Collection of algorithms implemented in Ruby"
  spec.homepage = "http://github.com/davidkariuki/algorithms"
  spec.license = "MIT"

  spec.files = `git ls-files -z`.split("\x0")
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.1"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "codeclimate-test-reporter"
  spec.add_development_dependency "geocoder"
end
