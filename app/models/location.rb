class Location < ApplicationRecord
  has_many :reports
  has_many :projects
  has_many :purchases
  belongs_to :user, optional: true

  validates :name, presence: true
  validates :position, presence: true
end
