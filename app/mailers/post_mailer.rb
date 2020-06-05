class PostMailer < ApplicationMailer
  default from: "test@sarojshakya.com.np"

  def post_approved(user, post)
    @user = user
    @post = post
    @subject = "Your blog post with title '" + post.title + "' approved"
    mail(to: @user.email, subject: @subject)
  end
end
