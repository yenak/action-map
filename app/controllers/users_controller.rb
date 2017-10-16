class UsersController < ApplicationController
    
    def user_params
        params.require(:user).permit(:username, :password)
    end
    
    def index
        @users = ObjectSpace.each_object(User)
    end
    
    def edit
        @user = User.find params[:id]
        @all_interests = User.all_interests
        @selected_interests = @user.interests
        if @selected_interests = nil or @selected_interests = []
            @selected_interests = @all_interests
        end
    end
    
    def new
    end
    
    def create
        @user = User.create!(user_params)
        flash[:notice] = "#{@user.username} was successfully created."
        redirect_to users_path
    end
    
end
