class MeetsController < ApplicationController
  before_action :set_meet, only: %i[edit update destroy]

  def index
    @meets = Meet.order(meet_day: :desc).page(params[:page])
  end

  def show
    @meet = Meet.find(params[:id])
  end

  def edit; end

  def new
    @meet = Meet.new
  end

  def create
    @relationship = current_user.relationship
    @meet = @relationship.meet.build(meet_params)
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

  def meet_params
    params.require(:meet).permit(:meet_day, :status)
  end

  def set_meet
    @relationship = current_user.relationship
    @meet = @relationship.meet.find(params[:id])
  end
end