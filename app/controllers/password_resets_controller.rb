class PasswordResetsController < ApplicationController
  def create
    # byebug
    @user= User.find_by(email: params[:password_reset][:email].downcase)
    if !!@user
      @user.send_password_reset
      # @user.reset_token = User.new_token
      # UserMailer.password_reset_token(@user).deliver_now
      render json: {message: "Email sent with password reset instructions"}
    else 
      render json: {message: "Email addresss not found"}
    end
  end

  def update
    # byebug
      user = User.find_by(reset_digest: params[:token], email: params[:email])
      if user.present? && user.password_token_valid?
        if params[:password]==params[:password_confirmation]
          user.reset_password(params[:password])
          render json: {
            message: "Your password has been successfuly reset!"
          }
        else
          render json: { message: "password not matching" }, status: :unprocessable_entity
        end
      elsif !use = User.find_by(email: params[:email])
        render json: {message:  ['invalid email address']}, status: :not_found
      else
        render json: {message:  ['Link not valid or expired. Try generating a new link.']}, status: :not_found
      end
  end
end
