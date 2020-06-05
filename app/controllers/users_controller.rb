class UsersController < ApplicationController
  def index
    @users = User.order(created_at: :desc)
  end

  # getposts current_user

  def posts
    user_id = current_user.id
    if params[:id]
      user_id = params[:id]
    end
    @user = User.find(user_id)
    @posts = @user.posts.where(:user_id => user_id).order(created_at: :desc)
  end
end
