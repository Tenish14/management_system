class Role < ApplicationRecord
    has_many :users, dependent: :nullify
    has_many :role_permissions

    validates :name, presence: true
    validates :description, presence: true
end
