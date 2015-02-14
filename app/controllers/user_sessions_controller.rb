class UserSessionsController < ApplicationController
  before_action :check_login, except: :destroy
  def new
  end

  def create
    user = User.find_by_username(params[:username])

    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      redirect_to user_groups_path(user)
    else
      redirect_to root_url,
        alert: "Username or password is wrong!"
    end
  end

  def destroy
    session.delete :current_user_id
    redirect_to root_url
  end


  private 
  def check_login
    if current_user 
      redirect_to user_groups_path(current_user)
    end
  end
end
