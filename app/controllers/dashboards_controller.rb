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
    reward = Reward.find_by(relationship_id: current_user.relationship_id)
    @our_reward = reward.content

    not_meet_day = Reward.find_by(relationship_id: current_user.relationship_id)
    @not_meet_day = reward.not_meet_day
  end
end
