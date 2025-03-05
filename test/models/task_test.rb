require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  def setup
    @task = Task.create!(title: 'Test Task')
    @subtask1 = @task.subtasks.create!(title: 'Subtask 1', completed_status: true)
    @subtask2 = @task.subtasks.create!(title: 'Subtask 2', completed_status: false)
  end

  test 'should create a task with valid attributes' do
    assert @task.valid?
    assert_equal 'Test Task', @task.title
  end

  test 'should mark task as incomplete when subtasks are pending' do
    @task.complete_task
    assert_not @task.completed_status
  end

  test 'should mark task as completed when all subtasks are completed' do
    @subtask2.update!(completed_status: true)
    @task.complete_task
    assert @task.completed_status
  end

  test 'should not delete task if there are pending subtasks' do
    @task.destroy

    assert @task.deleted?, false
  end
end
