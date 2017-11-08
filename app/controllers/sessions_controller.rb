class SessionsController < ApplicationController

  # Handle Google OAuth 2.0 login callback.
  #
  # GET /auth/google_oauth2/callback
  def create
    user_info = request.env["omniauth.auth"]

    if not User.where(id: (user_info["uid"].to_i/10000000000000).to_s)
        user           = User.new
        user.id        = (user_info["uid"].to_i/10000000000000).to_s
        user.save
    end
    flash[:notice] = "Logged in as #{user_info.info.name}!"

    # session[:user] = Marshal.dump(user)
    puts user_info

    redirect_to root_path
  end

  def destroy
    session.delete :user

    redirect_to root_path
  end

end