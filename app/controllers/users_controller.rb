class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    @relationship = Relationship.new
    @user = User.new
  end

  def create
    @relationship = Relationship.new
    @user = User.new(user_params)
    @user.invitation_digest = SecureRandom.alphanumeric(8)

    if @user.save && @relationship.save
      @user.update(relationship_id: @relationship.id)
      Geocoder.search(:address, params: {contorycodes: "ja"})
      auto_login(@user)
      redirect_to dashboards_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar, :avatar_cache, :address)
  end

  def invite
    unless (@user && !@user.activated? &&
        @user.authenticated?(:invite, params[:id])) #params[:id]はメールアドレスに仕込まれたトークン
      flash[:danger] = "無効なリンクです。"
      redirect_to root_url
    end
  end
end