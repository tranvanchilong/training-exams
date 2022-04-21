class ExamcartsController < ApplicationController
  skip_before_action:verify_authenticity_token
  before_action :examcart, only: [:selecting, :destroy]
    
  def show_select
    @exam_carts = Examcart.all
  end

  def selecting
    @exam_carts = @user.examcarts.includes(:exam) # fix N+1
    @title= "selecting"
    @user = User.find(params[:id])
    @users= @user.selecting.paginate(page: params[:page])
    render 'show_select'
  end
                      
  def create
    other_exam = Exam.find(params[:exam_id])
    @rel= Examcart.new(user_id: session[:user_id],
                                exam_id: other_exam.id)
                                @rel.save
                                redirect_to(root_url)
  end
 
  def destroy
    @user = Examcart.find(params[:id]).exam
    current_user.unselect(@user)
    redirect_to(root_url)
  end

  private

  def examcart
    @user = User.find(session[:user_id])
    redirect_to(root_url) unless current_user?(@user)
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
end