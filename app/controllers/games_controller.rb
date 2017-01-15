class GamesController < ApplicationController
  def index
    # tweet_results = $twitter.search("nintendo -rt", result_type: "recent", lang: "en").to_a.shuffle
    # @tweets = tweet_results.take(tweet_results.length / 2)
    # @tweet_codes = @tweets.map {|tweet| tweet.user.id}
    # @backgrounds = ["streetbackground.png", "industrial-background.jpg", "forestpassage.png", "forestbg.png", "BatmanArkhamKnightGothamCity.jpg", "creek.png", "cove.png", "chicago.png"]
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(tweet_subject: game_params["tweet_subject"], player_id: session[:user_id], score: 0)
    if @game.save
      puts "TEEEEEEEEST"
      redirect_to action: :show, id: @game.id
    end
  end

  def show
    @game = Game.find(params[:id])
    puts "does it get here"
    tweet_results = $twitter.search("nintendo -rt", result_type: "recent", lang: "en").to_a.shuffle
    @tweets = tweet_results.take(tweet_results.length / 2)
    @tweet_codes = @tweets.map {|tweet| tweet.user.id}
    @backgrounds = ["/streetbackground.png", "/industrial-background.jpg", "/forestpassage.png", "/forestbg.png", "/BatmanArkhamKnightGothamCity.jpg", "/creek.png", "/cove.png", "/chicago.png"]
  end


  private

  def game_params
    params.require(:game).permit(:tweet_subject)
  end

end
