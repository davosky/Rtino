class ProjectStatus < ApplicationRecord
  has_many :projects

  validates :name, presence: true
  validates :position, presence: true
end
