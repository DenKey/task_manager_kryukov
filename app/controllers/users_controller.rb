class UsersController < ApplicationController
  def index
    @users = User.paginate(page: params[:page], :per_page => 10)
  end

  def destroy
    if current_user.admin?
      user = User.find(params[:id])
      if current_user.id == user.id
        flash[:error] = "Sorry you can't delete himself"
        redirect_to users_url and return
      else
        user.destroy
        flash[:success] = "User delete"
        redirect_to users_url
      end
    else
      flash[:error] = "You not have premission"
      redirect_to lists_url
    end
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