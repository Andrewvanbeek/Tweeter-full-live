class TwitterfeedsController < ApplicationController
  def index

    if params["tweet"]
      @user = User.find_by(id: session[:user_id])
      tweet_id = params['tweet']
      tweet_user = $twitter.user(tweet_id.to_i)
      name = tweet_user.screen_name
      @user.tweet(name, session[:user_id])
    end
  end


end