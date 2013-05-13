class DashboardController < ApplicationController
  def show
    @statuses = TwitterService.track('Venezuela')
  end
end