$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ajax_upload/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ajax_upload"
  s.version     = AjaxUpload::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of AjaxUpload."
  s.description = "TODO: Description of AjaxUpload."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.4"

  s.add_development_dependency "activerecord-jdbcsqlite3-adapter"
end
