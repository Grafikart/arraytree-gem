$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "array_tree/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "array_tree"
  s.version     = ArrayTree::VERSION
  s.authors     = ["Jonathan Boyer"]
  s.email       = ["contact@grafikart.fr"]
  s.homepage    = "https://github.com/Grafikart/arraytree-gem"
  s.summary     = "The goal of this gem is to add some usefull methods for array."
  s.description = "The goal of this gem is to add some usefull methods for array."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.3"

  s.add_development_dependency "sqlite3"
end
