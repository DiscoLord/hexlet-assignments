# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  # BEGIN
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user
  end

  def new?
    create?
  end

  def update?
    user&.admin? || user&.id == record.author_id
  end

  def edit?
    update?
  end

  def destroy?
    user&.admin?
  end
  # END
end
