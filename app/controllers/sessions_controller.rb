class SessionsController < ApplicationController
  def create
    if user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
    end
    redirect_to user_path(user)
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
