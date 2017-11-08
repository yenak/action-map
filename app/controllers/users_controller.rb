class UsersController < ApplicationController

    def index
        @users = User.all
    end

    def edit
        @user = User.find params[:id]
        @all_interests = User.all_interests
        @selected_interests = @user.interests
        if params[:interests]
            @selected_interests = params[:interests].keys
            @user.update_attributes!(:interests => @selected_interests)
        end
        if @selected_interests.nil? or @selected_interests == []
            @selected_interests = @all_interests
        end

    end

end
