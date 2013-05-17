class Tweet < ActiveRecord::Base
  attr_accessible  :username,
                   :message,
                   :location,
                   :published

  def self.fetch_tweets(query)
    tweets = TwitterService.track(query)
    build_tweets(tweets)
  end

  def self.build_tweets(tweets)
    tweets.collect{ |tweet| build_tweet(tweet) }
  end

  def self.build_tweet(tweet)
    new_tweet = Tweet.new
    new_tweet.username  = tweet.attrs[:user][:screen_name]
    new_tweet.message   = tweet.attrs[:text]
    new_tweet.location  = tweet.attrs[:user][:location]
    new_tweet.published = tweet.attrs[:created_at]
    new_tweet.save
    new_tweet
  end
end