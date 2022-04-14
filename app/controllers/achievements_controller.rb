class AchievementsController < ApplicationController
  def index
    @user = User.find params[:user_id]
    if @user
      @user_exams = @user.user_exams.includes(:exam) # fix N+1
    else
      flash[:danger] = "User not found"
      redirect_to root_url
    end
  end

  def user_params
    params.require(:user).permit :name, :email, :password,
                                 :password_confirmation
  end
end
