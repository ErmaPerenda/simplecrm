class UsersController < ApplicationController
	def new
    @user = User.new
  	end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:current_user_id] = @user.id
      redirect_to user_groups_path(@user),
      notice: "Successfull registration. Welcome!"
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation,:username, :surname, :company)
  end
end

