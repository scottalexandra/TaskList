class TasksController < ApplicationController
  respond_to :json, :html

  def new
    @list_id = params[:list_id]
  end

  def create
    list = List.find(params[:task][:list_id])
    @task = list.tasks.new(task_params)
    if @task.save
      SendEmail.email_user(params, @task)
      respond_to do |format|
        format.html { flash[:notice] = "Task successfully created"; redirect_to list_path(list.id) }
        format.js
      end
    else
      flash[:error] = "Something went wrong, please try again"
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
    @list_id = params[:list_id]
  end

  def update
    @task = Task.update(params[:id], task_params)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @task = Task.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to list_path(params[:list_id]) }
      format.js
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :due, :description, :completed)
  end
end
