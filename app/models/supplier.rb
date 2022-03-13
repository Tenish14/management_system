class Supplier < ApplicationRecord
    belongs_to :company

    has_many :supplier_items
    has_many :items, through: :supplier_items
    has_many :locations, through: :supplier_items



    before_save { email.downcase! }

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :first_name, presence: true, length: { maximum: 100 }
    validates :last_name, presence: true, length: { maximum: 100 }
    validates :username, presence: true, length: { maximum: 100 }
    validates :email, presence: true, length: { maximum: 255 }
    validates :email, presence: true, length: { maximum: 255},
                                                format: { with: VALID_EMAIL_REGEX },
                                                uniqueness: true
    validates :phone_number, presence: true
    validates :company_id, presence: true
end
