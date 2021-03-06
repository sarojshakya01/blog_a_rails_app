module UsersHelper
  def get_username(user_id)
    # User.find(user_id).username
    # temp soln for username
    email = User.find(user_id).email
    to = email.index("@")
    username = email[0, to]
    return username
  end

  def get_num_of_posts(user_id)
    Post.where(:user_id => user_id).count
  end
end
