class Vendor < ApplicationRecord
belongs_to :user, optional: true
has_many :purchases

validates :name, presence: true
validates :vat_number, presence: true
end
