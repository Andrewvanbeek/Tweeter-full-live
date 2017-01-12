class GamesController < ApplicationController
  def index
    doc = Nokogiri::HTML(open("https://twitter.com/i/streams/category/686639666779394060"))
    doc = doc.css("#doc")
    @body = doc.to_s
    tweet_results = $twitter.search("#sony -rt", filter: "images", result_type: "recent").take(36).to_a.shuffle
    @tweets = tweet_results.take(9)
    @backgrounds = ["streetbackground.png", "industrial-background.jpg", "forestpassage.png", "forestbg.png", "BatmanArkhamKnightGothamCity.jpg", "creek.png", "cove.png", "chicago.png", "bridge.jpg"]
  end

  def create
       ws = Webshot::Screenshot.instance
       background = ws.capture "http://www.google.com", "google.png", width: 1600, height: 1600, quality: 8
       @background = background.path
       puts "HOOOOOOOOOOOOO YEAH"
      render json: { item: @background.to_s  }
  end
end
