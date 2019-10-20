class Purchase < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :location, optional: true
  belongs_to :structure, optional: true
  belongs_to :category, optional: true
  belongs_to :purchase_typology, optional: true
  belongs_to :vendor, optional: true

  validates :request_date, presence: true
  validates :request_person, presence: true
  validates :location_id, presence: true
  validates :structure_id, presence: true
  validates :category_id, presence: true

  def set_name
    last_name = Purchase.maximum(:name)
    self.name = last_name.to_i + 1
  end
end
