class Category < ApplicationRecord
  has_many :assistances

  validates :name, presence: true
  validates :position, presence: true
end
