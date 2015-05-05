class Seed
  def initialize
    build_incomplete_tasks
    build_complete_tasks
    build_unarchived_lists
    build_archived_lists
  end

  def build_incomplete_tasks
    i = 1
    10.times do
      Task.create(title: "task #{i}", due: "5/11/15")
      i = i + 1
    end
  end

  def build_complete_tasks
    i = 11
    10.times do
      Task.create(title: "task #{i}", status: "complete", due: "5/5/15")
      i = i + 1
    end
  end

  def build_unarchived_lists
    i = 1
    10.times do
      List.create(title: "list #{i}")
      i = i + 1
    end
  end

  def build_archived_lists
    i = 11
    10.times do
      List.create(title: "list #{i}", archived: true)
      i = i + 1
    end
  end
end
Seed.new
