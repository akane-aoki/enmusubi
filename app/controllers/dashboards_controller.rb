class DashboardsController < ApplicationController
  def index
    # current_user.relationship.meet.relationship_id = current_user.relationship_id
    # @relationship = current_user.relationship

    # user = User.find(current_user.id).includes(:relationship)
    # user.relationship.xxxx
    # @relation = Relationship.user
    # @user = User.where(relationship_id: current_user.relationship_id)
    # @meet = @user.meet.find(params[:id])

    # @meet = Meet.where(relationship_id: current_user.relationship_id).order(meet_day: :desc).limit(1).pluck(:meet_day)

    # meetsモデル
    today = Date.current
    meet_arr = Meet.where(relationship_id: current_user.relationship_id).order(meet_day: :desc).limit(1)
    @meet = meet_arr.pluck(:meet_day).first

    if @meet
      @day_count = (@meet - today).to_i
    end

    # effortsモデル
    my_effort_arr = Effort.where(user_id: current_user.id).pluck(:body)
    @my_effort = my_effort_arr[0]

    # rewardsモデル
    @reward = Reward.find_by(relationship_id: current_user.relationship_id)
    @meets_second = Meet.where(relationship_id: current_user.relationship_id).order(meet_day: :desc).pluck(:meet_day).second

    if @reward
      @reward_count = (today - @meets_second).to_i
    end

    @not_meet_day = Reward.find_by(relationship_id: current_user.relationship_id)

    # distances
    @partner = User.where.not(id: current_user.id).find_by(relationship_id: current_user.relationship_id)

    @distance = Geocoder::Calculations.distance_between([current_user.latitude,current_user.longitude],[@partner.latitude,@partner.longitude]).round
  end
end
