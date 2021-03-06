# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'asra/version'

Gem::Specification.new do |spec|
  spec.name          = "asra"
  spec.version       = Asra::VERSION
  spec.authors       = ["sanjeev singh"]
  spec.email         = ["snjvsingh123@gmail.com"]

  spec.summary       = %q{Evaluates the rental properties for buying.}
  spec.description   = %q{Simple modelling to figure out if the rental property is viable.}
  spec.homepage      = "https://github.com/sanjeevs/asra.git"
  spec.license       = "MIT"

 
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_dependency "finance"
end
