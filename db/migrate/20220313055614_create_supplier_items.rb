class CreateSupplierItems < ActiveRecord::Migration[7.0]
  def change
    create_table :supplier_items do |t|
      t.belongs_to :supplier
      t.belongs_to :item
      t.belongs_to :location

      t.timestamps
    end
  end
end
