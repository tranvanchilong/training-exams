class AchievementsController < ApplicationController
  before_action :correct_user, only: [:index]
  
  def index
    @user_exams = @current_user.user_exams.includes(:exam) # fix N+1
  end
end
