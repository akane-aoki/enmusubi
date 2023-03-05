class DistancesController < ApplicationController
  before_action :guest_check

  def index
    partner = User.partner(current_user)
    meets_arr = Meet.meets_arr(current_user)
    @meet_first = Meet.meets_all(current_user).limit(1).first.meet_day_start
    @today = Date.current

    if @meet_first && @meet_first >= @today
      @meets_count = meets_arr.length - 1
    elsif @meet_first && @meet_first <= @today
      @meets_count = meets_arr.length
    end

    @distance = Geocoder::Calculations.distance_between([current_user.latitude,current_user.longitude],[partner.latitude,partner.longitude]).round

    @total_distances = @distance * @meets_count
  end
end
