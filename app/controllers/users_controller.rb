class UsersController < ApplicationController
  before_action :manage, only: [:index,:destroy]

  def index
    @users = User.paginate(page: params[:page], :per_page => 10)
  end

  def destroy
    user = User.find(params[:id])
    if current_user.id == user.id
      flash[:error] = "Sorry you can't delete himself"
      redirect_to users_url and return
    else
      user.destroy
      flash[:success] = "User delete"
      redirect_to users_url
    end
  end

  def finish_signup
    if request.patch? && params[:user]
      @user = User.find(current_user)
      if @user.update(email: user_params[:email])
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

  def manage
    unless current_user.admin?
      flash[:error] = "You not have premission"
      redirect_to lists_url
    end
  end

end