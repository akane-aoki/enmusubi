class DashboardsController < ApplicationController
  def index
    # meetsモデル
    today = Date.current
    meet_arr = Meet.where(relationship_id: current_user.relationship_id).order(meet_day_start: :desc).limit(1)
    @meet = meet_arr.pluck(:meet_day_start).first

    if @meet
      @day_count = (@meet - today).to_i
    end

    # effortsモデル
    @my_effort = Effort.find_by(user: current_user)

    # rewardsモデル
    @reward = Reward.find_by(relationship_id: current_user.relationship_id)
    @meets_second = Meet.where(relationship_id: current_user.relationship_id).order(meet_day_start: :desc).pluck(:meet_day_start).second

    if @reward && @meets_second
      @reward_count = (today - @meets_second).to_i
    end

    @not_meet_day = Reward.find_by(relationship_id: current_user.relationship_id)

    # distances
    partner = User.where.not(id: current_user.id).find_by(relationship_id: current_user.relationship_id)

    meets_arr = Meet.where(relationship_id: current_user.relationship_id).order(meet_day_start: :desc).pluck(:meet_day_start)
    @meet_first = Meet.where(relationship_id: current_user.relationship_id).order(meet_day_start: :desc).limit(1).pluck(:meet_day_start).first
    @today = Date.current

    if @meet_first && @meet_first >= @today
      @meets_count = meets_arr.length - 1
    elsif @meet_first && @meet_first <= @today
      @meets_count = meets_arr.length
    end

    if current_user.address && partner && @meets_count
      @distance = Geocoder::Calculations.distance_between([current_user.latitude,current_user.longitude],[partner.latitude,partner.longitude]).round
      @total_distances = @distance * @meets_count
    end
  end
end
