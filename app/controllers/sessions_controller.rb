class SessionsController < ApplicationController

  # GET /sign_in
  def new
  end

  # POST /sign_in
  def create
    if PramatiLdap::authenticate(params[:username], params[:password])

      # Since the 'user' object is immutable, it can safely be serialized and
      # stored in a session
      session[:user] = User.new(params[:username])

      redirect_to root_path, alert: 'Successfully signed in'
    else
      flash.now[:error] = 'Invalid username and password'
      render action: :new
    end
  end

  # DELETE /sign_out
  def destroy
    session[:username], session[:user], session[:is_admin] = nil, nil, nil
    flash[:alert] = 'You\'re logged out of the application'
    redirect_to signin_path
  end
end

