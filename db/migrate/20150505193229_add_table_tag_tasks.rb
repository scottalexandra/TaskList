class AddTableTagTasks < ActiveRecord::Migration
  def change
    create_table :tag_tasks, id: false do |t|
      t.belongs_to :tag, index: true
      t.belongs_to :task, index: true
    end
  end
end
