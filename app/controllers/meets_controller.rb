class MeetsController < ApplicationController
  before_action :set_user, only: %i[edit update destroy]
  before_action :guest_check

  def index
    @meet_first = Meet.meets_all(current_user).limit(1).first
    @today = Date.current

    @meets_all = Meet.meets_all(current_user).page(params[:page])

    if Meet.meets_include_meet_first(current_user)
      @meets = @meets_all
    elsif Meet.meets_except_meet_first(current_user)
      @meets = @meets_all.last(@meets_all.length - 1)
    end

    meet_arr = Meet.meets_all(current_user).limit(1)
    @meet = meet_arr.pick(:meet_day_start)
    if @meet && @meet >= @today
      @day_count = (@meet - @today).to_i
    end
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
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @meet.update(meet_params)
      redirect_to meets_path, success: t('defaults.message.updated', item: Meet.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: Meet.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @meet.destroy!
    redirect_to meets_path, success: t('defaults.message.deleted', item: Meet.model_name.human), status: :see_other
  end

  private

  def set_user
    @meet = Meet.find(params[:id])
  end

  def meet_params
    params.require(:meet).permit(:meet_day_start, :meet_day_end, :status)
  end
end