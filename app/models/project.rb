class Project < ActiveRecord::Base
  has_many :tasks, -> { order(position: :asc) }  
  validates :title, presence: true, length: { minimum: 5, maximum: 35 }
end
