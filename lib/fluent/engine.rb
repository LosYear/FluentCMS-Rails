require 'fluent/dependencies'

module Fluent
  class Engine < ::Rails::Engine
    isolate_namespace Fluent
    middleware.use ::I18n::JS::Middleware
  end
end
