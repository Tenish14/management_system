class Location < ApplicationRecord
    belongs_to :company, class_name: "Company", optional: true

    validates :address_1, presence: true
    validates :address_2, presence: true
    validates :postcode, presence: true
    validates :state, presence: true
    validates :country, presence: true
end
