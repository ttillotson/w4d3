class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :login!

  def current_user
    return nil unless session[:session_token].present?
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def login!(user)
    # debugger
    session[:session_token] = user.reset_session_token!
  end
end
