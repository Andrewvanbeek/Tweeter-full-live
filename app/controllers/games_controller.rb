class GamesController < ApplicationController
  def index
    tweet_results = $twitter.search("sony -rt", result_type: "recent", lang: "en").to_a.shuffle
    @tweets = tweet_results.take(tweet_results.length / 2)
    @backgrounds = ["streetbackground.png", "industrial-background.jpg", "forestpassage.png", "forestbg.png", "BatmanArkhamKnightGothamCity.jpg", "creek.png", "cove.png", "chicago.png"]
  end

  def create
       ws = Webshot::Screenshot.instance
       background = ws.capture "http://www.google.com", "google.png", width: 1600, height: 1600, quality: 8
       @background = background.path
       puts "HOOOOOOOOOOOOO YEAH"
      render json: { item: @background.to_s  }
  end
end
