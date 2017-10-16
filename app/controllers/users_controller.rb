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
        if @selected_interests.nil? or @selected_interests == []
            @selected_interests = @all_interests
        end
    end

    def new
    end

    def create
        begin
            @user = User.create!(user_params)
            flash[:notice] = "#{@user.username} was successfully created."
            redirect_to users_path
        rescue
            flash[:notice] = "#{@user.username} could not be created."
            redirect_to new_user_path
        end
    end

    def show
       redirect_to edit_user_path
    end

    def authenticate
        user = User.where(username: params[:username])[0]
        if user.nil? or user.password != params[:password]
            flash[:error] = "That username and password combination does not exist."
            redirect_to login_user_path
        else
            redirect_to users_path
        end
    end

    def login
    end

    def show
    end

end
