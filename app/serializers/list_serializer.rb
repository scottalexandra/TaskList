class ListSerializer < ActiveModel::Serializer
  attributes :id, :title, :archived

  has_many :tasks
end
