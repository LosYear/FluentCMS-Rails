require 'fluent/dependencies'

module Fluent
  class Engine < ::Rails::Engine
    isolate_namespace Fluent
  end
end
