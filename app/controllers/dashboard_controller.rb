class DashboardController < ApplicationController
  def show
    @tweets = Tweet.fetch_tweets('Venezuela')
  end
end