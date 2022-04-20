class StaticPagesController < ApplicationController
  def home
    @exams = Exam.all
  end

   def create
        other_exam = Exam.find(params[:exam_id])
        @rel= ExamCart.new(user_id: session[:user_id],
                                exam_id: other_exam.id)
                                @rel.save
                                redirect_to user_path(other_exam)
    end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

    def create
        other_exam = Exam.find(params[:exam_id])
        @rel= ExamCart.new(user_id: current_user.id,
                                exam_id: other_exam.id)
                                @rel.save
                                redirect_to user_path(other_exam)
    end

   def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by id: user_id
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by id: user_id
      if user&.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
    end

    def selecting
            @title= "selecting"
            @user = User.find(params[:id])
            @users= @user.selecting.paginate(page: params[:page])
            render 'show_follow'
            end
                    
 def destroy
    @user = ExamCart.find(params[:id]).exam
    current_user.unselect(@user)
    respond_to do |format|
    format.html { redirect_to @user }
            format.js
    end
    end
end
