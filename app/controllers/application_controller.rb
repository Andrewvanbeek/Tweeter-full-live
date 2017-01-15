class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


def proper_user(id)
  if session[:user_id] == id
    else
  end
end

helper_method :proper_user
end
