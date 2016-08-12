module Fluent
  class News < ActiveRecord::Base
    validates :title, presence: true
    validates :content, presence: true
    validates :preview, presence: true
  end
end