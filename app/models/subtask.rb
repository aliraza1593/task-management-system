class Subtask < ApplicationRecord
  acts_as_paranoid
  belongs_to :task
  after_save :update_task_status

  private

  def update_task_status
    task.complete_task
  end
end
