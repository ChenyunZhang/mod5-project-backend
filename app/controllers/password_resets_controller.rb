class PasswordResetsController < ApplicationController
  def create
    # byebug
    @user= User.find_by(email: params[:password_reset][:email].downcase)
    if !!@user
      @user.reset_token = User.new_token
      UserMailer.password_reset(@user).deliver_now
      render json: {message: "Email sent with password reset instructions"}
    else 
      render json: {message: "Email addresss not found"}
    end
  end

  def update
  end
end
