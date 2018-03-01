class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :user
  belongs_to :attraction

  def take_ride
    @user = User.find(self.user_id)
    @attraction = Attraction.find(self.attraction_id)

    if @user.tickets > @attraction.tickets && @user.height > @attraction.min_height
      @user.update(tickets: @user.tickets - @attraction.tickets)
      @user.update(nausea: @user.nausea + @attraction.nausea_rating)
      @user.update(happiness: @user.happiness + @attraction.happiness_rating)
      "testing testing testing"
    elsif @user.tickets < @attraction.tickets && @user.height < @attraction.min_height
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif @user.tickets < @attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif @user.height < @attraction.min_height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    end
  end

  def create_notification
    flash[:notice] = take_ride
  end
end
