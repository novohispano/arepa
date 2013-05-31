class ChangePublishedInTweets < ActiveRecord::Migration
  def change
    change_column :tweets, :published, :datetime
  end
end
