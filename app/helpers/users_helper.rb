module UsersHelper
  def get_num_of_posts(user_id)
    Post.where(:user_id => user_id).count
  end
end
