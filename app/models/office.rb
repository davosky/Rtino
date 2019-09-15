class Office < ApplicationRecord
  has_many :assistances

  validates :name, presence: true
  validates :position, presence: true
end
