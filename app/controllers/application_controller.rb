class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :logged_in?, :current_user, :login_required

  def logged_in?
    !current_user.nil?
  end

  def current_user
    session[:user]
  end

  def login_required
    unless logged_in?
      redirect_to signin_path, notice: 'You need to be logged in before accessing this page'
    end
  end

end
