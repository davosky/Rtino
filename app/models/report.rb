class Report < ApplicationRecord
  belongs_to :location, optional: true
  belongs_to :structure, optional: true
  has_many :assistances, dependent: :destroy
  accepts_nested_attributes_for :assistances, reject_if: :all_blank, allow_destroy: true

  validates :date, presence: true
  validates :location_id, presence: true
  validates :structure_id, presence: true

  before_create :set_name

  def set_name
    last_name = Report.maximum(:name)
    self.name = last_name.to_i + 1
  end
end
