class Role < ApplicationRecord
    belongs_to :user, class_name: "User", optional: true

    validates :name, presence: true
    validates :description, presence: true
end
