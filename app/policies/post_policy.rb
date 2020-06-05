class PostPolicy < ApplicationPolicy
  def update?
    user.user_role == "admin" || !record.is_approved
  end

  def show?
    user.id == record.user_id
  end

  def destroy?
    user.id == record.user_id || user.user_role == "admin"
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
