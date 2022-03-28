class AddCostAndProfitToItem < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :cost, :decimal
    add_column :items, :profit, :decimal
  end
end
