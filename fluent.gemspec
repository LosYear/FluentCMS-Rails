$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "fluent/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "fluent"
  s.version     = Fluent::VERSION
  s.authors     = ["LosYear"]
  s.email       = ["losevyaroslav@gmail.com"]
  s.homepage    = "https://github.com/LosYear/FluenCMS-Rails"
  s.summary     = "Fluent CMS mountable"
  s.description = "Mountable engine written in Ruby on Rails which provides basic CMS functional"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 5.0"
  s.add_dependency "devise", "~> 4.2"
  s.add_dependency "cancan", "~> 1.6"
  s.add_dependency "mysql2"

  # Assets
  s.add_dependency "jquery-rails", "~> 4.2"
  s.add_dependency "font-awesome-rails"
  s.add_dependency "bootstrap-sass", "~> 3.3"
  s.add_dependency "formtastic", "~> 3.1"
  s.add_dependency "formtastic-bootstrap", "~> 3.1", ">= 3.1.1"
  s.add_dependency "datagrid", "~> 1.4"
  s.add_dependency "ckeditor", "~> 4.2"
  s.add_dependency "paperclip", "~> 5.1"
  s.add_dependency "nprogress-rails", "~> 0.2"
  #s.add_dependency "themes_on_rails", github: "LosYear/themes_on_rails"

  # Assets processing
  s.add_dependency "uglifier", '>= 1.3.0'
  s.add_dependency "sass-rails", "~> 5.0"
  s.add_dependency "coffee-rails", "~> 4.1"

  # Etc
  s.add_dependency "i18n-js", '>= 3.0.0.rc11'
  s.add_dependency "wiselinks", "~> 1.2"
  s.add_dependency "friendly_id", "~> 5.1"
  s.add_dependency "rails-settings-cached", "~> 0.6"
  s.add_dependency "kaminari", "~> 0.17"
  s.add_dependency "will_paginate", "~> 3.1"
  s.add_dependency "will_paginate-bootstrap", "~> 1.0"
  #s.add_dependency "jquery-datatables-rails", github: 'rweng/jquery-datatables-rails'


  # Development and testing
  s.add_development_dependency "sqlite3"
end