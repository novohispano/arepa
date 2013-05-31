class DashboardController < ApplicationController
  def show
    @tweets = Tweet.all.reverse
  end

  def fetch_tweets
    Tweet.fetch_tweets('Venezuela')

    redirect_to root_path
  end
end