class User < ApplicationRecord
    belongs_to :role
    belongs_to :company
    before_save { email.downcase! }

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :first_name, presence: true, length: { maximum: 50}
    validates :last_name, presence: true, length: { maximum: 50}
    validates :username, presence: true, length: { maximum: 50}
    validates :email, presence: true, length: { maximum: 255},
               format: { with: VALID_EMAIL_REGEX },
               uniqueness: true
    has_secure_password
    validates :password , presence: true, length: { minimum: 6 }
    validates :role_id, presence: true
    validates :company_id, presence: true

    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

end
