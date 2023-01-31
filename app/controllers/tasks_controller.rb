class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
  
  def show
    @task = Task.find(params[:id])
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = 'タスクが正常に追加されました。'
      redirect_to @task
    else
      task.now[:danger] = 'タスクの追加に失敗しました。'
      render :new
    end
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    
    if @task.update(task_params)
      flash[:success] = 'タスクが正常に更新されました。'
      redirect_to @task
    else
      task.now[:danger] = 'タスクが正常に更新されませんでした。'
      render :new
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    
    flash[:success] = 'タスクの削除が完了しました。'
    redirect_to tasks_url
  end
  
  #Strong Param HTTPリクエストの送信に対するセキュリティ対策
  def task_params
    params.require(:task).permit(:content)
  end
  
end


  