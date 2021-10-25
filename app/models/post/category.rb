# frozen_string_literal: true

class Post
  class Category < ApplicationRecord
    has_many :posts
  end
end
