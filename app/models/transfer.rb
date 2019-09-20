class Transfer < ApplicationRecord
  belongs_to :transport, optional: true
  belongs_to :user, optional: true

  validates :transfer_date, presence: true
  validates :departure, presence: true
  validates :start_point, presence: true
  validates :start_address, presence: true
  validates :arrival, presence: true
  validates :destination, presence: true
  validates :destination_address, presence: true

  before_create :set_name

  def set_name
    last_name = Transfer.maximum(:name)
    self.name = last_name.to_i + 1
  end
end
