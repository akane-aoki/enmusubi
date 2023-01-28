class MeetsController < ApplicationController
  before_action :set_user, only: %i[edit update destroy]

  def index
    # @user = User.includes(:relationship)
    @meet = Relationship.joins(:user, :meet).where(relationship_id: current_user.relationship_id).select(:meet_day).limit(1)
    # @meet = Meet.find_by(relationship_id: current_user.relationship_id)

    # @meet = Meet.where(relationship_id: current_user.relationship_id).order(meet_day: :desc).limit(1).pluck(:meet_day)
    # @meet = Meet.where(relationship_id: current_user.relationship_id).order(meet_day: :desc).limit(1).pluck(:meet_day)
    # @meets1 = Meet.where(relationship_id: current_user.relationship_id).order(meet_day: :desc).pluck(:meet_day) - @meet
    @meets = @meets1
  end

  def show
    @meet = Meet.find(params[:id])
  end

  def edit; end

  def new
    @meet = Meet.new
  end

  def create
    # @relationship = current_user.relationship_id
    @meet = Meet.new(meet_params)
    @meet.relationship_id = current_user.relationship_id

    if @meet.save
      redirect_to meets_path, success: t('defaults.message.created', item: Meet.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_created', item: Meet.model_name.human)
      render :new
    end
  end

  def update
    if @meet.update(meet_params)
      redirect_to meets_path, success: t('defaults.message.updated', item: Meet.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: Meet.model_name.human)
      render :edit
    end
  end

  def destroy
    @meet.destroy!
    redirect_to meets_path, success: t('defaults.message.deleted', item: Meet.model_name.human), status: :see_other
  end

  private

  def set_user
    @meet = Meet.find(params[:id])
    @meet.relationship_id = current_user.relationship_id
  end

  def meet_params
    params.require(:meet).permit(:meet_day, :status)
  end
end