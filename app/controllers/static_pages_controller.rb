class StaticPagesController < ApplicationController
  before_action :correct_user
  
  def home
    @exams = Exam.all
    @exam_users = @exam.user_exams.includes(:exam)
  end
  
 
end
