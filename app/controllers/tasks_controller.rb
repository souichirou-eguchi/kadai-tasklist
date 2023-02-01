class TasksController < ApplicationController
  before_action :set_task, only:[:show, :edit, :update, :destroy]
  
  def index
    @tasks = Task.all
  end
  
  def show
    
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = 'タスクが正常に追加されました'
      redirect_to @task
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
  
  def set_task
    @task = Task.find(params[:id])
  end  
  #Strong Param HTTPリクエストの送信に対するセキュリティ対策
  
  def task_params
    params.require(:task).permit(:content, :status)
  end
  
end


  