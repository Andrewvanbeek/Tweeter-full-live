class TwitterfeedsController < ApplicationController
  def index
    if params["tweet"]
      tweet_id = params['tweet']
      tweet_user = $twitter.user(tweet_id.to_i)
      name = tweet_user.screen_name
      $twitter.update("@#{name} It is Saturday!")
    end
  end


end