class Tag < ActiveRecord::Base
  has_many :tags_tasks
  has_many :tasks, through: :tags_tasks
  validates :title, presence: true

end
