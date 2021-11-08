#  frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  def edit?
    author?
  end

  def update?
    author?
  end

  def destroy?
    author?
  end

  private

  def author?
    user == record.creator
  end
end
