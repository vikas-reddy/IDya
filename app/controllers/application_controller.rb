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

=begin #not necessary
	protected
	def apply_validations
		@valid_request = true
		validation_method = "#{params[:controller]}_#{params[:action]}_validation"
		if respond_to?(validation_method)
			send validation_method
		end
	end
=end
end
