class SessionsController < ApplicationController

    def new
      session.delete :user_id
    end
  
    def create
      # byebug
      user = User.find_by(username: params[:username])
      # First check if the user exists
      # Then check if this user is authentic
      if user && user.authenticate(params[:password]) # Shortcircuiting
        session[:user_id] = user.id # The magic for making us logged in
        Order.find_or_create_by(user_id: session[:user_id], status: "active")
        redirect_to user_path(user)
      else
        render 'new'
      end
    end
  
    def destroy
      order = Order.find_by(user_id: session[:user_id], status: "active")
      order.update(user_id: session[:user_id], status: "unfinished")
      session.delete :user_id
      redirect_to "/login"
    end
  end