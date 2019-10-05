class Project < ApplicationRecord
  belongs_to :project_typology, optional: true
  belongs_to :project_status, optional: true
  belongs_to :location, optional: true
  belongs_to :structure, optional: true
  belongs_to :office, optional: true
  belongs_to :user, optional: true

  has_many :tasks, dependent: :destroy
  accepts_nested_attributes_for :tasks, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true
  validates :start_date, presence: true
  validates :project_typology_id, presence: true
  validates :project_priority, presence: true
end
