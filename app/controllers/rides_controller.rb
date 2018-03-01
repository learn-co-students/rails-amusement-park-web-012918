class RidesController < ApplicationController

  def create
    @ride = Ride.new
    @ride.create_notification
    redirect_to 'user_path(@ride.user_id)'
  end
end
