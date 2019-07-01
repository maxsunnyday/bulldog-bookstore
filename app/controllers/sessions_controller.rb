class SessionsController < ApplicationController

    def new
    end
  
    def create
      # byebug
      user = User.find_by(email: params[:email])
      # First check if the user exists
      # Then check if this user is authentic
      if user && user.authenticate(params[:password]) # Shortcircuiting
        session[:user_id] = user.id # The magic for making us logged in
        redirect_to user_path(user)
      else
        render 'new'
      end
    end
  
    def destroy
      session.delete :user_id
      redirect_to "/login"
    end
  end