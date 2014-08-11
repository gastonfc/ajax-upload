$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ajax_upload/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ajax_upload"
  s.version     = AjaxUpload::VERSION
  s.authors     = ["Gaston Fernandez"]
  s.email       = ["gaston.fernandez@pyxis.com.uy"]
  s.homepage    = "https://github.com/gastonfc/ajax-upload"
  s.summary     = "Upload files using ajax"
  s.description = "Upload files using ajax"
  s.license     = "MIT"

  s.files = Dir["{app,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.4"
  s.add_dependency "railties"
  s.add_dependency "jquery-rails"
  s.add_dependency "json"

  s.add_development_dependency "activerecord-jdbcsqlite3-adapter"
end
