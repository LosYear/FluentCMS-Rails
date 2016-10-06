module Fluent
  class Node < ApplicationRecord
    # Validation
    validates :slug, presence: true, uniqueness: { case_sensitive: false }
    validates :title, presence: true
    validates :content, presence: true

    def self.inheritance_column
      nil
    end
  end
end