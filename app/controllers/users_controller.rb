class UsersController < ApplicationController
  before_action :logged_in_user, only:[:index, :edit, :update, :destroy, ]
  before_action :correct_user, only: [:edit, :update, :show]
  def new
    @user = User.new
  end

  def index
    # @users=User.all
    @users=User.paginate(page: params[:page])
  end
  def show

  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "controller.user.flash_success"
      redirect_to root_url
    else
      render :new
    end
  end
  def edit
 
  end

  def update

    if @user.update(user_params)
      # Handle a successful update.
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password, :address,
                                 :password_confirmation
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  # Confirms the correct user.s
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end
