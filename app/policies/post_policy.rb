#  frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def new?
    user
  end

  def create?
    user
  end

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
