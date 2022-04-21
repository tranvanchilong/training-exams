class HistoryExamsController < ApplicationController
  before_action :history_exam, only: %i( show )

  def index
    @exams = Exam.order_by_name.paginate(page: params[:page], per_page: Settings.paginate.manage)
  end

  def show
    @questions = @exam.questions.order_by_content
  end

  private

  def exam_params
    params.require(:exam).permit :name, :pass_score, :time_limit
  end

  def history_exam
    @exam = Exam.find_by id: params[:id]
    return if @exam

    flash[:warning] = t "controller.admin.history_exam_fail"
    redirect_to history_exams_path
  end
end
