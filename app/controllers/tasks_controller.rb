class TasksController < ApplicationController
  def new
    @list_id = params[:list_id]
  end

  def create
    list = List.find(params[:task][:list_id])
    task = list.tasks.new(task_params)
    if task.save
      flash[:notice] = "Task successfully created"
      redirect_to list_path(list.id)
    else
      flash[:error] = "Something went wrong, please try again"
      render :new
    end
  end

  def udpate
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    respond_to do |format|
      format.html { redirect_to list_path(params[:list_id]) }
      format.js
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :due, :status)
  end
end
