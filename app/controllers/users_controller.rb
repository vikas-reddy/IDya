class UsersController < ApplicationController

  # GET /users/1
  def show
    @user = User.find(params[:id])
    @ideas = @user.ideas.page(params[:page] || 1).per(2)

    respond_to do |format|
      format.html # show.html.erb
    end
  end
end
