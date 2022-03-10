class Item < ApplicationRecord
    has_one :category, foreign_key: "category_id"

    validates :name, presence: true, length: { maximum: 50}
    validates :description, presence: true, length: { maximum: 50 }
    validates :quantity_stock, presence: true
    validates :price, presence: true
    validates :category_id, presence: true
end
