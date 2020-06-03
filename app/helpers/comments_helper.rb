module CommentsHelper
  def get_username(user_id)
    User.find(user_id).username
  end

end
