class Transport < ApplicationRecord
    has_many :transfers

    validates :name, presence: true
    validates :position, presence: true
end
