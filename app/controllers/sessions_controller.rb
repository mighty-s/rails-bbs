class SessionsController < ApplicationController
  def new
     
  end
  
  def create
    user = User.find_by(email: params[:email])
    if user&&user.authenticate(params[:password])
      log_in(user)
      redirect_to '/'
    else
      flash[:alert] = "로그인 실패"
      redirect_to new_session_path
    end
  end
  
  def destroy
      log_out
      redirect_to '/', notice: '성공적으로 로그아웃 되었습니다'
  end
  
  
  private
    def sessions_params
      params.require(:user).permit(:email, :password, :name)
    end
end
