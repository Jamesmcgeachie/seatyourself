class SessionsController < ApplicationController
  def new
  end

  def create
  		user = User.find_by(email: params[:email])
  		if user && user.authenticate(params[:password])
  			session[:user_id] = user.id
  			redirect_to restaurants_url, notice: "Welcome #{user.first_name}, you logged in successfully."
  		else
  			flash[:alert] = "Invalid email or password!"
  			render :new
  		end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to restaurants_url, notice: "You have logged out of Seat Yourself."
  end
end
