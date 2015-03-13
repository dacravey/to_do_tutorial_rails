class TaskController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @task = @list.task.new()
  end

  def create
    @list = List.find(params[:list_id])
    @task = @list.task.new(task_params)
    if @task.save
      flash[:notice] = "Task successfully added!"
    else
      render :new
    end
  end

  private
  def task_params
    params.require(:task).permit(:description)
  end
end
