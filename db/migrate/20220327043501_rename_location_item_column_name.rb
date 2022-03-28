class RenameLocationItemColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :location_items, :price, :outlet_price 
    rename_column :location_items, :cost, :outlet_cost
    rename_column :location_items, :profit, :outlet_profit
  end
end
