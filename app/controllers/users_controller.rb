class UsersController < ApplicationController
  def new
    @relationship = Relationship.new
    @user = User.new
  end

  def create
    @relationship = Relationship.new
    @user = User.new(user_params)

    if @user.save && @relationship.save
      @user.update(relationship_id: @relationship.id)
      auto_login(@user)
      redirect_to dashboards_path, success: 'ユーザー登録が完了しました'
    else
      flash.now[:danger] = 'ユーザー登録に失敗しました'
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar, :avatar_cache, :address)
  end
end