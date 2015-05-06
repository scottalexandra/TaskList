class AddColumnToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :description, :string
  end
end
