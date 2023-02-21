class ApplicationController < ActionController::Base
  
  private
  
  def counts(user)
    @count_microposts = user.microposts.count
  end
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def logged_in?
    !!current_user
  end
  
  def correct_user
    if logged_in?
      @task = current_user.tasks.find_by(id: params[:id])
      unless @task
        redirect_to login_path
      end
    else
      redirect_to login_path
    end
  end
end
