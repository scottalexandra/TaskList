class TagSerializer < ActiveModel::Serializer
  attributes :id, :title
  
  has_and_belongs_to_many :tasks

end
