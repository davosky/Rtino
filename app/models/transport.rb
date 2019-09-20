class Transport < ApplicationRecord
  has_many :transfers
  belongs_to :user, optional: true

  validates :name, presence: true
  validates :position, presence: true
end
