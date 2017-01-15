class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :name
      t.string :screen_name
      t.string :token
      t.string :sec
      t.timestamps null: false
    end
  end
end
