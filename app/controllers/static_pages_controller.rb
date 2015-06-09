class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :if_login, only: [:index]
  def index
  end

  def privacy_policy
  end

  private

  def if_login
    redirect_to lists_path if user_signed_in?
  end
end
