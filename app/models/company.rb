class Company < ApplicationRecord
    belongs_to :location

    has_many :users
    has_many :suppliers
    has_many :items

    has_many :location_items
    has_many :locations, through: :location_items
    has_many :items, through: :location_items


    before_save { email.downcase! }

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :name, presence: true, length: { maximum: 100 }
    validates :email, presence: true, length: { maximum: 255 }
    validates :email, presence: true, length: { maximum: 255},
                                                format: { with: VALID_EMAIL_REGEX },
                                                uniqueness: true
    validates :phone_number, presence: true
    validates :branch, presence: true
    validates :location_id, presence: true
end
