class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:login]
  skip_before_action :authorized, only: [:login, :logout, :index]
  def index
    p params
  end

  def login
    if params['username']
      user = User.find_by_username(params['username'])
      @valid = user.authenticate(params['password'])
      if @valid
        session[:user_id] = user.id
        redirect_to '/'
      else  
        flash.alert = "Incorrect username or password!"
        redirect_to '/home/login'
      end
    end 
  end 

  def logout
    session[:user_id] = nil
  end
end
