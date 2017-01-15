class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_from_omni(auth_hash)
    session[:user_id] = @user.id
    puts '###############################################################################'
    puts session[:user_id]
    redirect_to games_path
  end

  def index
    redirect_to oauth_path(:twitter)
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end