class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user
    helper_method :authorized

    def logged_in?
        !session[:user_id].nil?
    end

    # Let's us know who the current user is
    # Useful for authorization
    def current_user
        if logged_in?
            @current_user = User.find(session[:user_id])
        end
    end

    def authorized
        redirect_to "/login" unless logged_in?
    end
end
