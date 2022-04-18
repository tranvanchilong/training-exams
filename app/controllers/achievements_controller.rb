class AchievementsController < ApplicationController
  before_action :correct_user, only: [:index]
  
  def index
    if @user
      @user_exams = @user.user_exams.includes(:exam) # fix N+1
    else
      flash[:danger] = "User not found"
      redirect_to root_url
    end
  end

  private

  def correct_user
    @user = User.find(params[:user_id])
    redirect_to(root_url) unless current_user?(@user)
  end

end
