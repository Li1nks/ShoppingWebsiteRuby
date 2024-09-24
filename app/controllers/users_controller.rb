# Has a action that will give view access to a new User Instance
# Like Login action but will create and save new user db entry
# then shows an action that will give access to data for the currently
# logged in user
#
# Using strong params to declare what we want and allow to be
# injected for security
#
#

class UsersController < ApplicationController
  def new
        @user = User.new
  end

  def create
        @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id
          redirect_to root_path
        else
          render :new
        end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
        params.require(:user).permit(:username, :password)
  end
end # class end
