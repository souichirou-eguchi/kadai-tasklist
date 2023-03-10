class TasksController < ApplicationController
  before_action :require_user_logged_in, except:[:create, :update, :destroy]
  before_action :correct_user, except:[:index, :new, :create]
  
  def index
    @tasks = current_user.tasks
  end
  
  def show
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      flash[:success] = 'タスクが正常に追加されました'
      redirect_to root_path
    else
      flash.now[:danger] = 'タスクの追加に失敗しました'
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @task.update(task_params)
      flash[:success] = 'タスクが正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'タスクが正常に更新されませんでした'
      render :new
    end
  end
  
  def destroy
    @task.destroy
    flash[:success] = 'タスクの削除が完了しました。'
    redirect_to tasks_url
  end
  
  private
  
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_path
    end
  end
  
  #Strong Param HTTPリクエストの送信に対するセキュリティ対策
  
  def task_params
    params.require(:task).permit(:content, :status)
  end
  
end


  