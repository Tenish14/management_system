class Location < ApplicationRecord
    has_one :company

    validates :address_1, presence: true
    validates :address_2, presence: true
    validates :postcode, presence: true
    validates :state, presence: true
    validates :country, presence: true
end
