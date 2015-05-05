class List < ActiveRecord::Base
  has_many :tasks
  validates :title, presence: true
  
  scope :archived, -> { where(archived: true) }
  scope :unarchived, -> { where(archived: false) }
end
