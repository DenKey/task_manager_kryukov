class UsersController < ApplicationController
  def index
  end

  def show
  end

  def update
  end

  def destroy
  end

  def finish_signup
    if request.patch? && params[:user] #&& params[:user][:email]
      @user = User.find_by_email(user_params[:email])
      if @user.update(user_params)
        sign_in(@user, :bypass => true)
        redirect_to edit_user_registration_path , notice: 'Your profile was successfully updated.'
      else
        @show_errors = true
      end
    end
  end

  private

  def user_params
    accessible = [:email]
    accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
    params.require(:user).permit(accessible)
  end
end