class SessionsController < ApplicationController
  # skip_before_action :verify_authenticity_token
  skip_before_action :store_location, :authenticate_user!

  layout 'layouts/sessions'
  def index
    @page_title = '车口碑'
    @user = User.new
  end

  def create
    if verify_rucaptcha?(@user)
      @user = User.has_store.find_by(phone: user_params[:phone])
      if @user && @user.authenticate(user_params[:password])
        sign_in(@user)
        flash[:success] = '登录成功'
      else
        flash[:danger] = '账户密码不正确，请重试!'
      end
      redirect_back_or root_path
    else
      @user = User.new
      flash[:error] = "登录失败,验证码错误"
      render 'sessions/index'
    end
  end

  def destroy
    session.destroy
    redirect_to sessions_path
  end
  private
  def user_params
    params.require(:user).permit(:phone, :password, :name)
  end
end
