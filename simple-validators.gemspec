$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "simple/validators/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "simple-validators"
  s.version     = Simple::Validators::VERSION
  s.authors     = ["Chris Mytton", "Paul Springett"]
  s.email       = ["paul@simpleweb.co.uk"]
  s.homepage    = "https://github.com/simpleweb/simple-validators"
  s.summary     = "Rails utilities"
  s.description = "Adds model validations to the host application"

  s.files = Dir["lib/**/*"] + ["Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_development_dependency "rails", "~> 4.0.2"
  s.add_dependency "activemodel", ">= 3.2"
end
