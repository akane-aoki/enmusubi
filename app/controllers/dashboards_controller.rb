class DashboardsController < ApplicationController
  def index
    # meetsモデル
    today = Date.current
    meet_arr = Meet.meets_all(current_user).limit(1)
    @meet = meet_arr.pick(:meet_day_start)

    if @meet && @meet >= today
      @day_count = (@meet - today).to_i
    end

    # effortsモデル
    @my_effort = Effort.find_by(user: current_user)

    # rewardsモデル
    @reward = Reward.find_by(relationship_id: current_user.relationship_id)
    if Meet.meet_second_include_meet_day_end(current_user)
      @meets_second = Meet.meet_second_include_meet_day_end(current_user)
    else
      @meets_second = Meet.meet_second_only_meet_day_start(current_user)
    end

    if @reward && @meets_second
      @reward_count = (today - @meets_second).to_i
    end

    @not_meet_day = Reward.find_by(relationship_id: current_user.relationship_id)

    # distances
    @partner = User.partner(current_user)

    meets_arr = Meet.meets_arr(current_user)
    if Meet.meets_all(current_user).limit(1).first
      @meet_first = Meet.meets_all(current_user).limit(1).first.meet_day_start
    end
    @today = Date.current

    if @meet_first && @meet_first >= @today
      @meets_count = meets_arr.length - 1
    elsif @meet_first && @meet_first <= @today
      @meets_count = meets_arr.length
    end

    if current_user.address && @partner && @meets_count
      if @partner.address
        @distance = Geocoder::Calculations.distance_between([current_user.latitude,current_user.longitude],[@partner.latitude,@partner.longitude]).round
        @total_distances = @distance * @meets_count
      end
    end
  end
end
