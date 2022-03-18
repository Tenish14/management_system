class AddPriceCostProfitToLocationItems < ActiveRecord::Migration[7.0]
  def change
    add_column :location_items, :price, :decimal
    add_column :location_items, :cost, :decimal
    add_column :location_items, :profit, :decimal
  end
end
