class Structure < ApplicationRecord
  has_many :reports

  validates :name, presence: true
  validates :position, presence: true
end
