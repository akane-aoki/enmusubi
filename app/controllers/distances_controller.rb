class DistancesController < ApplicationController
  before_action :guest_check

  def index
    partner = User.where.not(id: current_user.id).find_by(relationship_id: current_user.relationship_id)

    meets_arr = Meet.where(relationship_id: current_user.relationship_id).order(meet_day_start: :desc).pluck(:meet_day_start)
    @meet_first = Meet.where(relationship_id: current_user.relationship_id).order(meet_day_start: :desc).limit(1).pick(:meet_day_start)
    @today = Date.current

    if @meet_first && @meet_first >= @today
      @meets_count = meets_arr.length - 1
    elsif @meet_first && @meet_first <= @today
      @meets_count = meets_arr.length
    end

    @distance = Geocoder::Calculations.distance_between([current_user.latitude,current_user.longitude],[partner.latitude,partner.longitude]).round

    @total_distances = @distance * @meets_count
  end

  def show
  end
end
