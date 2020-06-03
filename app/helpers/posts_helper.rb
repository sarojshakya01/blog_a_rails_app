module PostsHelper
  def get_username(user_id)
    User.find(user_id).username
  end

  def get_datetime(input_date)
    input_date.strftime("%B %d, %Y, %A %I:%M %P")
  end
end
