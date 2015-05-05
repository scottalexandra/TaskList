class Seed
  def initialize
    build_incomplete_tasks
    build_complete_tasks
    build_unarchived_lists
    build_archived_lists
  end

  def build_incomplete_tasks
    i = 31
    10.times do
      Task.create(title: "task #{i}", due: "5/11/15")
      i = i + 1
    end
  end

  def build_complete_tasks
    i = 21
    10.times do
      Task.create(title: "task #{i}", status: "complete", due: "5/5/15")
      i = i + 1
    end
  end

  def build_unarchived_lists
    i = 1
    10.times do
      list = List.create(title: "list #{i}")
      task = Task.create(title: "task #{i}", due: "5/6/15")
      list.tasks << task
      i = i + 1
    end
  end

  def build_archived_lists
    i = 11
    10.times do
      list = List.create(title: "list #{i}", archived: true)
      task = Task.create(title: "task #{i}", status: "complete", due: "5/5/15")
      list.tasks << task
      i = i + 1
    end
  end
end
Seed.new
