class Tweet < ActiveRecord::Base
  attr_accessible  :username,
                   :message,
                   :location,
                   :published

  def self.fetch_tweets(query)
    tweets = tweets_from_query(query)
    build_tweets(tweets)
  end

  private

  def self.build_tweets(tweets)
    tweets.collect{ |tweet| build_tweet(tweet) }
  end

  def self.build_tweet(tweet)
    create( username:  tweet.attrs[:user][:screen_name],
            message:   tweet.attrs[:text],
            location:  tweet.attrs[:user][:location],
            published: tweet.attrs[:created_at] )
  end

  def self.tweets_from_query(query)
    TwitterService.track(query)
  end
end