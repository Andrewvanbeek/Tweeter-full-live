class CreateGames < ActiveRecord::Migration[5.0]
  def change
  create_table :games do |t|
      t.integer :player_id
      t.string :tweet_subject
      t.timestamps null: false
    end
  end
end
