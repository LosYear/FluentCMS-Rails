module Fluent
  class Page < Fluent::Node
    NODE_TYPE = "Fluent::Pages#show"

    default_scope {where(:type => NODE_TYPE)}

    def self.inheritance_column
      nil
    end
  end
end