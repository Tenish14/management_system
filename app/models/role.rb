class Role < ApplicationRecord
    belongs_to :user, class_name: "User", optional: true
end
