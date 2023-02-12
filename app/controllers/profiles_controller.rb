class ProfilesController < ApplicationController
  before_action :set_user, only: %i[edit update]

  def show
    @partner = User.where.not(id: current_user.id).find_by(relationship_id: current_user.relationship_id)
    if @partner.nil?
      return
    elsif @partner
      @partner.name
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to profile_path, success: t('defaults.message.updated', item: User.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_updated', item: User.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar, :avatar_cache, :address)
  end
end
