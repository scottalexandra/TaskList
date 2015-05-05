class Task < ActiveRecord::Base
  belongs_to :list
  has_many :tags_tasks
  has_many :tags, through: :tags_tasks

  validates :title, presence: true

  scope :complete, -> { where(status: "complete") }
  scope :incomplete, -> { where(status: "incomplete") }
end
