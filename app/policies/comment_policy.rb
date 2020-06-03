class CommentPolicy < ApplicationPolicy

  def update?
    user.id == record.user_id || user.user_role == "admin"
  end

  def show?
    user.id == record.user_id || user.user_role == "admin"
  end

  def edit?
    user.id == record.user_id || user.user_role == "admin"
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
