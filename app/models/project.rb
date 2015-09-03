class Project < ActiveRecord::Base
  has_many :tasks, -> { order(position: :asc) }, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5, maximum: 35 }
end