class Item < ApplicationRecord
    attr_accessor :location_ids, :outlet_prices, :outlet_costs, :outlet_profits
    belongs_to :category
    belongs_to :company

    has_many :location_items
    has_many :locations, through: :location_items

    has_many :supplier_items
    # has_many :locations, through: :supplier_items
    has_many :suppliers, through: :supplier_items


    validates :name, presence: true, length: { maximum: 50}
    validates :description, presence: true, length: { maximum: 50 }
    validates :quantity_stock, presence: true
    validates :price, presence: true
    validates :cost, presence: true
    validates :profit, presence: true
    validates :category_id, presence: true
    validates :company_id,presence: true
    # validates :location_ids, acceptance: { accept: ['TRUE', 'accepted'] }
end
