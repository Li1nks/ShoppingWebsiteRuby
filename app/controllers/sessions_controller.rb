# named this way so Rails can link the models, views, adn controlelrs together
# One Create action and will search our db for the user entry that matches
# username provided in the login form, authenticate w/ bcrypt and provided password
# and sets session[:user_id] and redirects user
#


class SessionsController < ApplicationController
  def create
    @user = User.find_by("usernam = ? OR email = ?", params[:identifier]. params[:identifier])

    if @user && @user.authenticate(params[:password])

      # Log user in
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:error] = "Invalid username/email or password."
      redirect_to login_path
    end
  end

  def destroy
        # logic to log user out
        session[:user_id] = nil
        redirect_to login_path
  end
end
