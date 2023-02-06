class RewardsController < ApplicationController
  before_action :set_user, only: %i[edit update]

  def index
    reward_arr = Reward.where(relationship_id: current_user.relationship_id).pluck(:content)
    @reward = reward_arr[0]

    not_meet_day_arr = Reward.where(relationship_id: current_user.relationship_id).pluck(:not_meet_day)
    @not_meet_day = not_meet_day_arr[0]
  end

  def new
    @reward = Reward.new
  end

  def create
    @reward = Reward.new(reward_params)
    @reward.relationship_id = current_user.relationship_id
    if @reward.save
      redirect_to rewards_path, success: t('defaults.message.created', item: Reward.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_created', item: Reward.model_name.human)
      render :new
    end
  end

  def edit; end

  def update
    if @reward.update(reward_params)
      redirect_to rewards_path, success: t('defaults.message.updated', item: Reward.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: Reward.model_name.human)
      render :edit
    end
  end

  private

  def set_user
    @reward = Reward.find_by(relationship_id: current_user.relationship_id)
    # @reward = Reward.find(params[:id])
  end

  def reward_params
    params.require(:reward).permit(:not_meet_day, :content)
  end
end
