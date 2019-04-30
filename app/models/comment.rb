class Comment < ApplicationRecord
validates :content, presence: true

attr_accessor :user
end
