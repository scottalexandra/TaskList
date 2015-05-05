class Task < ActiveRecord::Base
  belongs_to :list
  validates :title, presence: true
  
  scope :complete, -> { where(status: "complete") }
  scope :incomplete, -> { where(status: "incomplete") }
end
