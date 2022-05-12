class User::UserHistoryExamsController < ApplicationController
  before_action :load_resources, only: %i(show)

  def index
    @user_exams = UserExam.includes(:exam).where(user_id: current_user.id).order(created_at: :asc)
  end

  def show
  end

  private

  def load_resources
    # @history_exam = HistoryDoExam.history_do_exam_by_amount_test(params[:amount_test].to_i)
    @user_exam = UserExam.includes(:exam).find_by id: params[:id]
    @history_exams = HistoryDoExam.includes(:user, :question).where(amount_test: params[:amount_test].to_i)
    return if @history_exams && @user_exam

    flash[:warning] = t "controller.admin.load_history_exam_fail"
    redirect_to admin_exams_path
  end
end
