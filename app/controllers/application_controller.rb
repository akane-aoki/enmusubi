class ApplicationController < ActionController::Base
  before_action :require_login
  add_flash_types :success, :info, :warning, :danger

  private

  def not_authenticated
    flash[:danger] =  t('defaults.message.require_login')
    redirect_to login_path
  end

  def guest_check
    if current_user.name == "ゲストユーザー"
      redirect_to dashboards_path, notice: "このページを見るにはユーザー登録が必要です"
    end
  end
end
