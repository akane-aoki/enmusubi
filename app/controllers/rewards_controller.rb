class RewardsController < ApplicationController
  before_action :set_user, only: %i[show edit update]
  before_action :guest_check

  def index
    @rewards_all = Reward.rewards_all(current_user).page(params[:page])

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
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @reward = Reward.find_by(relationship_id: current_user.relationship_id)
    @not_meet_day_start = Reward.find_by(relationship_id: current_user.relationship_id)
  end

  def edit; end

  def update
    if @reward.update(reward_params)
      redirect_to rewards_path, success: t('defaults.message.updated', item: Reward.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: Reward.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @reward = Reward.find_by(relationship_id: current_user.relationship_id)
  end

  def reward_params
    params.require(:reward).permit(:not_meet_day, :content)
  end
end
