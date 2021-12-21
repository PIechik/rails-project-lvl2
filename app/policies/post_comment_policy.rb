#  frozen_string_literal: true

class PostCommentPolicy < ApplicationPolicy
  def create?
    user
  end
end
