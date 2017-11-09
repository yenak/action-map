class SessionsController < ApplicationController

  # Handle Google OAuth 2.0 login callback.
  #
  # GET /auth/google_oauth2/callback
  def create
    user_info = request.env["omniauth.auth"]
    user = User.find_by_uid(user_info["uid"].to_s)
    if user.length == 0
      user           = User.new
      user.provider  = user_info.provider
      user.uid       = user_info["uid"].to_s
      user.name      = user_info.info.name
      user.email     = user_info.info.email
      user.save
    else
      user = user[0]
    end
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    session.delete :user
    redirect_to root_path
  end

end