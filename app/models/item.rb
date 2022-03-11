class Item < ApplicationRecord
    belongs_to :category
    belongs_to :company


    validates :name, presence: true, length: { maximum: 50}
    validates :description, presence: true, length: { maximum: 50 }
    validates :quantity_stock, presence: true
    validates :price, presence: true
    validates :category_id, presence: true
    validates :company_id,presence: true
end
