module ApplicationHelper
  def is_admin?
    if (current_user)
      current_user.user_role == "admin"
    else
      false
    end
  end
end
