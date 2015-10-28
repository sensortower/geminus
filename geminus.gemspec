# coding: utf-8

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "geminus/version"

Gem::Specification.new do |spec|
  spec.name          = "geminus"
  spec.version       = Geminus::VERSION
  spec.authors       = ["Alexey V Zapparov"]
  spec.email         = ["ixti@member.fsf.org"]

  spec.summary       = "Simply share constants between backend/frontend."
  spec.description   = "Simply share constants between backend/frontend."
  spec.homepage      = "https://github.com/sensortower/geminus"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
    .reject { |f| f.match(%r{^(test|spec|features)/}) }

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rubocop"
end
