class Category < ApplicationRecord
    belongs_to :item, class_name: "Item", optional: true

    validates :name, presence: true
    validates :description, presence: true
end
