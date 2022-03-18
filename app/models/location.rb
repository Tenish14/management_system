class Location < ApplicationRecord
    belongs_to :company

    has_many :location_items
    has_many :items, through: :location_items

    # has_many :supplier_items
    # has_many :suppliers, through: :supplier_items
    # has_many :items, through: :supplier_items

    validates :address_1, presence: true
    validates :address_2, presence: true
    validates :postcode, presence: true
    validates :state, presence: true
    validates :country, presence: true
    validates :company_id, presence: true
end
