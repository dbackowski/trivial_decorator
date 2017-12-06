# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "trivial_decorator/version"

Gem::Specification.new do |spec|
  spec.name          = "trivial_decorator"
  spec.version       = TrivialDecorator::VERSION
  spec.authors       = ["Damian Baćkowski"]
  spec.email         = ["damianbackowski@gmail.com"]

  spec.summary       = "A simple decorator for Rails."
  spec.description   = "A simple decorator for Rails."
  spec.homepage      = "https://github.com/dbackowski/trivial_decorator"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", ">= 4.0.0", "< 6.0"
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec-rails", "~> 3.6.0"
  spec.add_development_dependency "sqlite3", "~> 1.3"
  spec.add_development_dependency "capybara", "~> 2.16.1"
  spec.add_development_dependency "factory_bot_rails", "~> 4.8.2"
  spec.add_development_dependency "kaminari", "~> 1.1.1"
end
