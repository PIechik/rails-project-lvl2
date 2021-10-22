# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  belongs_to :category
  has_many :comments, dependent: :destroy
end
