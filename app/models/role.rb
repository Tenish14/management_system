class Role < ApplicationRecord
<<<<<<< HEAD
    belongs_to :user, class_name: "User", optional: true

    validates :name, presence: true
    validates :description, presence: true
=======
    has_many :users
>>>>>>> add-associate-tables
end
