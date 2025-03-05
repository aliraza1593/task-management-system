class SubtasksController < ApplicationController
  before_action :set_task
  before_action :set_subtask, only: [:update]

  def create
    @subtask = @task.subtasks.new(subtask_params)

    if @subtask.save
      redirect_to @task, notice: 'Subtask created successfully!'
    else
      redirect_to @task, alert: 'Error adding subtask.'
    end
  end

  def update
    @subtask.update(completed_status: true)
    redirect_to @subtask.task, notice: 'Subtask completed!'
  end

  private

  def set_subtask
    @subtask = Subtask.find_by(id: params[:id])
  end

  def set_task
    @task = Task.find_by(id: params[:task_id])
  end

  def subtask_params
    params.require(:subtask).permit(:title)
  end
end
