class PurchaseTypology < ApplicationRecord
  belongs_to :user, optional: true
  has_many :purchases
end
