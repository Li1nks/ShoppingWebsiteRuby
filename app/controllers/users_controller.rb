class UsersController < ApplicationController
  before_action :require_login, only: [ :show ]  # Ensure users are logged in to access their profile

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id  # Log the user in after successful registration
      flash[:notice] = "Account created successfully!"  # Success message
      redirect_to root_path
    else
      flash[:alert] = "There was an error creating your account. Please try again."  # Error message
      render :new  # Re-render the new user form with error messages
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def index
        # @users.User.all
        @users = User.all
        if params[:check_schema]
          @schema_info = User.schema
          puts JSON.pretty_generate(@schema_info) # This will print the schema info to the Rails console
        end
  end

  def destroy
    @user = User.find(params[:id])
    if @user
      puts "User found: #{@user.username}"  # Debugging line
      @user.destroy
      flash[:notice] = "User deleted successfully."
      redirect_to root_path
    else
      flash[:alert] = "User not found."
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)  # Ensure only permitted parameters are accepted
  end

  # New method to restrict access to logged-in users
  def require_login
    unless session[:user_id]
      flash[:alert] = "You must be logged in to access this section"
      redirect_to login_path  # Redirect to login page if user is not logged in
    end
  end

  def check_schema
    @schema_info = User.schema
    render json: @schema_info # Return schema information as JSON
  end
end
