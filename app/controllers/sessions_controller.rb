# named this way so Rails can link the models, views, adn controlelrs together
# One Create action and will search our db for the user entry that matches
# username provided in the login form, authenticate w/ bcrypt and provided password
# and sets session[:user_id] and redirects user
#


class SessionsController < ApplicationController
  def create
    @user = User.find_by(username: params[:username])

    if !!@user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path
    else
      message = "There seems to be something wrong! Make sure your username and password are correct."
      redirect_to login_path, notice: message
    end
  end
end
