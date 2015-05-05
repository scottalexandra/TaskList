class Task < ActiveRecord::Base
  belongs_to :list
  has_and_belongs_to_many :tasks
  validates :title, presence: true

  scope :complete, -> { where(status: "complete") }
  scope :incomplete, -> { where(status: "incomplete") }
end
