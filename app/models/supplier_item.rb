class SupplierItem < ApplicationRecord
    belongs_to :supplier
    belongs_to :item
    belongs_to :location
end
