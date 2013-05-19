class DashboardController < ApplicationController
  def show
    @tweets = Tweet.all
  end

  def fetch_tweets
    Tweet.fetch_tweets('Venezuela')
  end
end