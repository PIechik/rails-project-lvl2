# frozen_string_literal: true

class Comment < ApplicationRecord
  has_ancestry

  belongs_to :user
  belongs_to :post

  validates :content, presence: true
  validates :user, presence: true
  validates :post, presence: true
end
