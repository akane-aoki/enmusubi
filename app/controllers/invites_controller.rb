class InvitesController < ApplicationController
  before_action :set_user
  before_action :guest_check

  def show; end

  def edit
  end

  def update
    byebug
    if params.present?
      @partner = User.find_by(invitation_digest: params[:user][:invitation_digest])
      @user.update(relationship: @partner.relationship)
    end

    # if @user.update(user_params)
    #   redirect_to invite_path, success: t('defaults.message.updated', item: User.model_name.human)
    # else
    #   flash.now['danger'] = t('defaults.message.not_updated', item: User.model_name.human)
    #   render :edit, status: :unprocessable_entity
    # end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:invitation_digest)
  end
end
