class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :username
      t.string :message
      t.string :location
      t.date :published

      t.timestamps
    end
  end
end
