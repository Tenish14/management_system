class AddSupplierPriceToSupplier < ActiveRecord::Migration[7.0]
  def change
    add_column :supplier_items, :supplier_price, :decimal
  end
end
