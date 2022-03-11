class Supplier < ApplicationRecord

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
end
