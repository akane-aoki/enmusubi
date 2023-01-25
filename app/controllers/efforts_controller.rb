class EffortsController < ApplicationController
  before_action :set_effort, only: %i[edit update]

  def index
  end

  def new
    @effort = Effort.new
  end

  def create
    @effort = current_user.efforts.build(effort_params)
    if @effort.save
      redirect_to efforts_path, success: t('defaults.message.created', item: Effort.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_created', item: Effort.model_name.human)
      render :new
    end
  end

  def edit; end

  def update
    if @effort.update(effort_params)
      redirect_to efforts_path, success: t('defaults.message.updated', item: Effort.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: Effort.model_name.human)
      render :edit
    end
  end

  private

  def set_effort
    @effort = current_user.efforts.find(params[:id])
  end

  def effort_params
    params.require(:effort).permit(:body)
  end
end