class DashboardController < ApplicationController
  def show
    @tweets = Tweets.all
  end

  def fetch_tweets
    Tweet.fetch_tweets('Venezuela')
  end
end