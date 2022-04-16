class ExamCartController < ApplicationController
    
  def new
    @exam_cart = Examcart.new
  end

  def create
    # @user = User.find params[:user_id]
    @exam_cart = Examcart.new exam_cart_params
    if @exam_cart.save
    #   flash[:success] = t "controller.user.flash_success"
      redirect_to root_url
    else
      render :new
    end
  end

  private

  def exam_cart_params
    params.require(:examcart).permit :user_id, :exam_id
  end
end
