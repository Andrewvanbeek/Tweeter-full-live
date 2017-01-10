class GamesController < ApplicationController
  def index
    doc = Nokogiri::HTML(open("https://twitter.com/i/streams/category/686639666779394060"))
    doc = doc.css("#doc")
    @body = doc.to_s
  end

  def create
       ws = Webshot::Screenshot.instance
       background = ws.capture "http://www.google.com", "google.png", width: 1600, height: 1600, quality: 8
       @background = background.path
       puts "HOOOOOOOOOOOOO YEAH"
      render json: { item: @background.to_s  }
  end
end
