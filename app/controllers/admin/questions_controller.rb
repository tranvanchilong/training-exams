class Admin::QuestionsController < ApplicationController
  before_action :load_exam, only: %i(new create)
  def new
    @question = @exam.questions.new
  end

  def create
    @question = @exam.questions.new question_params
    if @question.save
      flash[:success] = t "controller.admin.create_question_success"
      redirect_to admin_exam_path(@exam)
    else
      flash[:danger] = t "controller.admin.create_question_fail"
      redirect_to admin_exam_path(@exam)
    end
  end

  private

  def question_params
    params.require(:question).permit :content
  end

   def load_exam
    @exam = Exam.find_by(id: params[:exam_id])
    return if @exam

    flash[:warning] = t "controller.admin.load_exam_fail"
    redirect_to root_path
  end
end
