class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_from_omni(auth_hash)
    redirect_to games_path
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end