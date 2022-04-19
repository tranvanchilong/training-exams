class Admin::AnswersController < ApplicationController
  before_action :load_exam, :load_question, only: %i(new create)

  def new
    @answer = @question.answers.new
  end

  def create
    @answer = @question.answers.new answer_params
    if @answer.save
      flash[:success] = t "controller.admin.create_answer_success"
      redirect_to admin_exam_path(@exam)
    else
      flash[:danger] = t "controller.admin.create_answer_fail"
      redirect_to admin_exam_path(@exam)
    end
  end

  private

  def answer_params
    params.require(:answer).permit :content, :is_correct_answer
  end

  def load_exam
    @exam = Exam.find_by(id: params[:exam_id])
    return if @exam

    flash[:warning] = t "controller.admin.load_exam_fail"
    redirect_to root_path
  end

  def load_question
    @question = Question.find_by(id: params[:question_id])
    return if @question

    flash[:warning] = t "controller.admin.load_question_fail"
    redirect_to root_path
  end
end
