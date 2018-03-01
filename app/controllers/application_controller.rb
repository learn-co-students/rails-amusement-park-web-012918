class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?
  add_flash_types :notice

  def current_user
    session[:user_id] ||= nil
  end

  def logged_in?
    if session[:user_id] != nil
      true
    else
      false
    end
  end
end
