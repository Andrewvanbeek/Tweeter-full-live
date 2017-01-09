class GamesController < ApplicationController
  def index
    doc = Nokogiri::HTML(open("https://twitter.com/i/streams/category/686639666779394060"))
    doc = doc.css("#doc")
    @body = doc.to_s
  end
end
