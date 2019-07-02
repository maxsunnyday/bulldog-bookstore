class UsersController < ApplicationController
    before_action :authorized, only: [:show, :edit]

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)

        if @user.valid?
            session[:user_id] = @user.id # Logs me in after signing up
            redirect_to user_path(@user)
        else
            flash[:error] = @user.errors.full_messages
            render 'new'
        end
    end

    def show
        # byebug
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end

    def update

    end

    def destroy

    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :first_name, :last_name, :password, :password_confirmation)
    end
end