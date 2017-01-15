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
    tweet_count = $twitter.search("#{@game.tweet_subject} -rt", result_type: "recent", lang: "en").to_a.length
    if tweet_count > 14
      if @game.save
        puts "TEEEEEEEEST"
        redirect_to action: :show, id: @game.id
      end
    else
      @error = "not enough tweets on that subject"
      render "new"
    end
  end

  def show
    @game = Game.find(params[:id])
    @subject = @game.tweet_subject
    tweet_results = $twitter.search("#{@subject} -rt", result_type: "recent", lang: "en").to_a.shuffle
    if tweet_results.count > 8
    @tweets = tweet_results.take(tweet_results.length / 2)
    @tweet_codes = @tweets.map {|tweet| tweet.user.id}
    @backgrounds = ["/streetbackground.png", "/industrial-background.jpg", "/forestpassage.png", "/forestbg.png", "/BatmanArkhamKnightGothamCity.jpg", "/creek.png", "/cove.png", "/chicago.png"]
  else
    @game.destroy
    redirect_to new_games_path
  end
  end


  private

  def game_params
    params.require(:game).permit(:tweet_subject)
  end

end
