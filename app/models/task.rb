class Task < ActiveRecord::Base
  belongs_to :project
  acts_as_list scope: :project
  validates :title, :date, presence: true, length: { minimum: 1 }
end