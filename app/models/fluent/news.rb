module Fluent
  class News < Fluent::Node
    NODE_TYPE = "Fluent::News#show"

    default_scope {where(:type => NODE_TYPE)}

    def self.inheritance_column
      nil
    end
  end
end