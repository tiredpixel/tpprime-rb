# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tpprime/version'

Gem::Specification.new do |spec|
  spec.name          = "tpprime"
  spec.version       = Tpprime::VERSION
  spec.authors       = ["tiredpixel"]
  spec.email         = ["tp@tiredpixel.com"]
  spec.description   = %q{Simple command-line program for displaying multiplication grids of
prime numbers.}
  spec.summary       = %q{Simple command-line program for displaying multiplication grids of
prime numbers.}
  spec.homepage      = ""
  spec.license       = ""
  
  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
