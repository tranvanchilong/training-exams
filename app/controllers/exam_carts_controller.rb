class ExamCartsController < ApplicationController
  def new
    @exam_cart = ExamCart.new
  end

  def create
    @exam_cart = ExamCart.new exam_cart_params
    if @exam_cart.save
      redirect_to root_url
    else
      render :new
    end
  end

  private

  def exam_cart_params
    params.require(:exam_cart).permit session[:exam_id], session[:user_id]
  end  
end
