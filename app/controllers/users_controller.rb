class UsersController < ApplicationController

    def user_params
        params.require(:user).permit(:username, :password)
    end

    def index
        @users = User.all
    end

    def edit
        @user = User.find session[:user_id]
        @all_interests = User.all_interests
        if params[:interests]
            @selected_interests = params[:interests].keys
        else
            @selected_interests = Array.new
        end
        @user.update_interests(@selected_interests)
        redirect_to user_path(@user)
    end

    def new
    end

    def create
    end

    def show
       redirect_to edit_user_path
    end

    def login
    end

    def show
        @user = User.find session[:user_id]
        @all_interests = User.all_interests
        @selected_interests = @user.interests
    end

end
