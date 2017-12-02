class UsersController < ApplicationController

    def index
        @users = User.all
    end

    def edit
        @user = User.find params[:id]
        if params[:interests]
            @selected_interests = params[:interests].keys
        else
            @selected_interests = ""
        end
        @user.update_interests(@selected_interests)
        redirect_to user_path(@user)
    end

    def show
       redirect_to edit_user_path
    end

    def show
        @user = User.find params[:id]
        @all_interests = User.all_interests
        @selected_interests = @user.interests
    end

end
