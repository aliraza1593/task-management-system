class AddDeletedAtToSubtasks < ActiveRecord::Migration[7.2]
  def change
    add_column :subtasks, :deleted_at, :datetime
    add_index :subtasks, :deleted_at
  end
end
