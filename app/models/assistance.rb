class Assistance < ApplicationRecord
  belongs_to :report
  belongs_to :category, optional: true
  belongs_to :office, optional: true

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
end
