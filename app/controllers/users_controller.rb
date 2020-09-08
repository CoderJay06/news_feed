class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  def index
    @users = User.all 
  end

  def new
    @user = User.new 
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      p @user.errors.count
      session[:user_id] = @user.id
      redirect_to @user, alert: "User created successfully"
    else  
      redirect_to new_user_path, alert: @user.errors.full_messages
    end
  end

  def user_params
    params.require(:user).permit(:username, :password, :email, :salt, :encrypted_password)
  end 

end
