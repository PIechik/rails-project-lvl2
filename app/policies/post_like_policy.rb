#  frozen_string_literal: true

class PostLikePolicy < ApplicationPolicy
  def create?
    user
  end

  def destroy?
    author?
  end

  private

  def author?
    user == record.user
  end
end
