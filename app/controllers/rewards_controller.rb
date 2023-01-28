class RewardsController < ApplicationController
  def index

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

  def reward_params
    params.require(:reward).permit(:not_meet_day, :content)
  end
end
