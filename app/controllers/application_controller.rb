class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  after_action :allow_iframe
  protect_from_forgery with: :exception
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :not_found

  private

  def not_found
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end

  def allow_iframe
    # response.headers['X-Frame-Options'] = 'ALLOW-FROM http://iframe.demo.com:8000/'
  end
end
