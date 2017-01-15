class User < ApplicationRecord
  has_many :games, {foreign_key: :player_id}

   def self.find_or_create_from_omni(auth_hash)
    user = find_or_create_by(provider: auth_hash.provider, uid: auth_hash.uid)
    user.update(
      name: auth_hash[:info][:name],
      screen_name: auth_hash[:info][:screen_name],
      token: auth_hash.credentials.token,
      sec: auth_hash.credentials.secret
      )
    user
  end

  def tweet(name, session_id)
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['CONSUMER_KEY']
      config.consumer_secret     = ENV['CONSUMER_SECRET']
      config.access_token        = token
      config.access_token_secret = sec
    end
    if session_id == id
      @client.update("@#{name}, I played your tweet!")
    end
  end
end
