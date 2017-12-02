class SessionsController < ApplicationController

  # Handle Google OAuth 2.0 login callback.
  #
  # GET /auth/google_oauth2/callback
  def create
    user_info = request.env["omniauth.auth"]
    user = User.find_by_uid(user_info["uid"].to_s)
    if not user
      user = User.create(provider: user_info.provider,
                         uid: user_info["uid"].to_s,
                         name: user_info.info.name,
                         email: user_info.info.email,
                         interests: "")
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      session[:user_id] = user.id
      redirect_to root_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

end