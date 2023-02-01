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

    @day_count = (@meet - today).to_i

    # rewardsモデル
    @my_reward = Reward.where(relationship_id: current_user.relationship_id).pluck(:content)
  end
end
