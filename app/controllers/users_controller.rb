class UsersController < ApplicationController
  # def index
  #   if logged_in?
  #     @users = User.all
  #   else
  #     redirect_to login_path
  #   end
  # end

  # def show
    
  #   @user = User.find(params[:id])
  #   @tasks = @user.tasks.order(id: :desc)
  # end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = '登録しました。'
      redirect_to root_path
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
