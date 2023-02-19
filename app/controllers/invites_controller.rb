class InvitesController < ApplicationController
  before_action :set_user
  before_action :guest_check

  def show; end

  def edit
    @user.invitation_digest = ""
  end

  def update
    if params.present?
      @partner = User.find_by(invitation_digest: params[:user][:invitation_digest])
      if @user.update(relationship_id: @partner.relationship_id)
        redirect_to invite_path, success: t('defaults.message.invited')
      else
        flash.now['danger'] = t('defaults.message.not_invited')
        render :edit, status: :unprocessable_entity
      end
    else
      flash.now['danger'] = t('defaults.message.not_invited')
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:invitation_digest, :relationship_id)
  end
end
