class GamesController < ApplicationController
  def index
    tweet_results = $twitter.search("nintendo -rt", result_type: "recent", lang: "en").to_a.shuffle
    @tweets = tweet_results.take(tweet_results.length / 2)
    @tweet_codes = @tweets.map {|tweet| tweet.user.id}
    @backgrounds = ["streetbackground.png", "industrial-background.jpg", "forestpassage.png", "forestbg.png", "BatmanArkhamKnightGothamCity.jpg", "creek.png", "cove.png", "chicago.png"]
  end


end
