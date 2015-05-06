class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :completed, :due

end
