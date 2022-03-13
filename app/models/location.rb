class Location < ApplicationRecord
    has_one :company

    has_many :location_items
    has_many :companies, through: :location_items
    has_many :items, through: :location_items

    has_many :supplier_items
    has_many :suppliers, through: :supplier_items
    has_many :items, through: :supplier_items

    validates :address_1, presence: true
    validates :address_2, presence: true
    validates :postcode, presence: true
    validates :state, presence: true
    validates :country, presence: true
end
