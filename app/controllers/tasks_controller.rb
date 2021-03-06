class TasksController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def new
    @list = List.find(params[:list_id])
    @task = @list.tasks.new()
  end

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(task_params)
    if @task.save
      flash[:notice] = "Task successfully added!"
      redirect_to list_path(@task.list)
    else
      render :new
    end
  end


  def edit
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
  end

  def update
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
    if @task.update(params[:task])
      flash[:notice] = "Task successfully updated!"
      redirect_to lists_path(@task.list)
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to lists_path(@task.list)
    flash[:notice] = "Task successfully deleted!"
  end

  def complete
    params[:tasks_checkbox].each do |check|
      task_id = check
      @task = Task.find_by_id(task_id)
      @task.update_attribute(:done, true)
    end
    redirect_to list_path(@task.list)
  end

  private
  def task_params
    params.require(:task).permit(:description, :done)
  end
end
