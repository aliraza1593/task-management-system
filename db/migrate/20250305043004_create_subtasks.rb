class CreateSubtasks < ActiveRecord::Migration[7.2]
  def change
    create_table :subtasks do |t|
      t.string :title
      t.boolean :completed_status, default: false
      t.references :task

      t.timestamps
    end
  end
end
