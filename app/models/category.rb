class Category < ApplicationRecord
  has_many :assistances
  belongs_to :user, optional: true

  validates :name, presence: true
  validates :position, presence: true
end
