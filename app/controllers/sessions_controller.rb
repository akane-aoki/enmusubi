class SessionsController < ApplicationController
  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_back_or_to dashboards_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end

  def destroy
    logout
    redirect_to login_path, success: t('.success')
  end

  def guest_login
    @guest_user = User.create(
    name: 'ゲスト',
    email: SecureRandom.alphanumeric(15) + "@email.com",
    password: 'password',
    password_confirmation: 'password'
    # address: ''
    # relationship_id: SecureRandom.random_number(1 << 64) 
    )
    auto_login(@guest_user)
    redirect_to dashboards_path, success: 'ゲストとしてログインしました'
  end
end
