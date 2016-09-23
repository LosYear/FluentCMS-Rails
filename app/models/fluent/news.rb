module Fluent
  class News < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true
    validates :preview, presence: true
  end
end