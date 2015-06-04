class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :if_login
  def index
  end

  def privacy_policy
  end

  private

  def if_login
    redirect_to lists_path if user_signed_in?
  end
end
