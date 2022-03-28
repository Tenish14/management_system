class Role < ApplicationRecord
    has_many :users, dependent: :nullify
    belongs_to :role_permission

    validates :name, presence: true
    validates :description, presence: true
    validates :role_permission_id, presence: true
end
