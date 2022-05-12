class AddColumusToTasks < ActiveRecord::Migration[6.0]
  def change
      add_column :tasks, :status, :integer, null: false, default: 0
      add_column :tasks, :priority, :integer, null: false, default: 0
  end
end
