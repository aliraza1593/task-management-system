class TasksController < ApplicationController
  before_action :set_task, only: %i[show destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: 'Task created successfully!'
    else
      render :new
    end
  end

  def show
  end

  def destroy
    if @task.destroy
      redirect_to tasks_path, notice: 'Task deleted successfully!'
    else
      redirect_to @task, alert: 'Cannot delete task with pending subtasks.'
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :completed)
  end
end
