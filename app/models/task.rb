class Task < ApplicationRecord
  acts_as_paranoid
  validates :title, presence: true
  has_many :subtasks, dependent: :destroy
  before_destroy :ensure_no_pending_subtasks
  def complete_task
    update(completed_status: subtasks.all?(&:completed_status))
  end

  private

  def ensure_no_pending_subtasks
    throw(:abort) if subtasks.exists?(completed_status: false)
  end
end
